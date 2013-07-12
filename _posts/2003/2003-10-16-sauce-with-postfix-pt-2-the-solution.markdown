---
layout: post
title: ! 'Sauce with Postfix Pt. 2: The solution'
date: 2003-10-16 12:14:36 +01:00
categories:
- Geekery
tags:
- Geekery
---
Further to my previous entry [Sauce with Postfix](http://www.endless.org.uk/blog/archives/2003/10/16/000463.html),
inspiration struck as to getting it to work.  I've implemented it locally and
it appears to be functional, but I'd like somebody smart to go over my working
(please just leave a comment here) before I even think of sending it in the
general direction of Mr Jackson.  It should also be noted that these
instructions are only tested on SAUCE version 0.7.14 and Postfix 2.0.16, both
running on Debian Sarge.  I make no guarantees about it working with anything
else at all.

Postfix allows you to run with an alternative configuration, by setting the
`MAIL_CONFIG` environment variable to the name of a directory
containing the configuration.  To complicate matters though, Postfix also
ignores any UCE restrictions specified in the configuration unless the program
is running as `$mail_owner`.  So, let's start by setting up an
alternative Postfix configuration in `/etc/sauce`.  I copied my
existing `main.cf` across and I will need to remember to keep the
two copies in sync.  I guess the important parts are to keep the delivery and
virtual configurations consistent.  (Maybe it would really be more sensible to
have a minimal configuration which just passes the mail onto the real Postfix
daemon, but I'll think about that more closely later.)

Anyway, the only change required to work correctly with SAUCE is to *remove*
`permit_mynetworks` from `smtpd_recipient_restrictions`.  If you haven't
explicitly specified that configuration option in your `/etc/sauce/main.cf`, it
should probably be set to:

{% highlight ini %}
smtpd_recipient_restrictions = reject_unauth_destination
{% endhighlight %}

This has the effect of no longer implicitly trusting connections from localhost
(and so not allowing it to relay mail to other machines).  You will also have
to add to your primary Postfix configuration
(`/etc/postfix/main.cf`) the following line:

{% highlight ini %}
alternate_config_directories = /etc/sauce
{% endhighlight %}

or it will get upset when we try to run with the alternative configuration.  In
order to avoid warnings about the file being missing (and definitely if you use
dynamic maps of some variety for virtual domain or alias lookups) you may want
to symlink `/etc/postfix/dynamicmaps.cf` into
`/etc/sauce`.

Next up is to try and convince SAUCE to run `/usr/sbin/sendmail` as
the 'postfix' user, with the environment variable
`MAIL_CONFIG=/etc/sauce`.  Fortunately SAUCE already depends on a
neat piece of software called
[userv](http://www.chiark.greenend.org.uk/~ian/userv/) which allows particular
programs to be executed as another user.  So, using one of the existing
configuration snippets as an example, I created
`/etc/userv/services.d/sauce-postfix-sendmail` with the following:

{% highlight tcl %}
if ( glob calling-user mail
   & glob service-user postfix
   )
        suppress-args
        no-disconnect-hup
        execute /usr/share/sauce/postfix-sendmail
fi
{% endhighlight %}

which should allow SAUCE to run the program
`/usr/share/sauce/postfix-sendmail` as the 'postfix' user.  The
program is just a straightforward shell script:

{% highlight bash %}
#!/bin/sh

# I would write this in TCL to be consistent with the rest of SAUCE,
# but I'd have to understand TCL first...

# Source configuration
test -f /etc/sauce/sys-config || exit 1
. /etc/sauce/sys-config

exec /usr/sbin/sendmail -bs
{% endhighlight %}

`/etc/sauce/sys-config` now just has the extra line
`MAIL_CONFIG=/etc/sauce; export MAIL_CONFIG` to tell sendmail where
the Postfix configuration is.  We're nearly done.  All that's left is a small
patch to SAUCE itself, namely:

{% highlight diff %}
--- smtp~	2003-06-15 16:46:40.000000000 +0100
+++ smtp	2003-10-16 11:24:12.000000000 +0100
@@ -884,9 +884,14 @@
 }

 thread_subproc ic mtachan_open {} {
-    set lcmd [list open |[list sendmail -bs -oem \
-	    -oMa $state(ra) -oMr $state(smtpstyle)-sauce \
-	    -oMs $state(rh) -oMt $state(ident)] r+]
+    global postfix_sendmail
+    if ($postfix_sendmail) {
+        set lcmd [list open |[list userv postfix sauce-postfix-sendmail] r+]
+    } else {
+        set lcmd [list open |[list sendmail -bs -oem \
+	        -oMa $state(ra) -oMr $state(smtpstyle)-sauce \
+	        -oMs $state(rh) -oMt $state(ident)] r+]
+    }
     debug 2 "running sendmail: $lcmd"
     set state(mtachan) [eval $lcmd]
     fconfigure $state(mtachan) -blocking false -translation {binary crlf}
--- sconfig~	2003-06-15 16:46:40.000000000 +0100
+++ sconfig	2003-10-16 11:09:48.000000000 +0100
@@ -33,6 +30,7 @@
 config_var always_blacklist_site     false  boolean
 config_var blacklist_all_addresses   false  boolean
 config_var blacklist_on_bounces      false  boolean
+config_var postfix_sendmail          false  boolean

 config_var conns_max                 120    number	     1  10000
{% endhighlight %}

Turn on the changes by adding `postfix_sendmail true` to
`/etc/sauce/config`.

That should do the job.  Restart SAUCE and irritate it until it's ecstatic with
you.  You still lose some data from the Postfix logs (connections which happen
through SAUCE will appear to have originated at localhost according to Postfix)
so I would still be better off switching to somebody else's idea of the One
True MTA, but at least SAUCE now behaves in the way one would expect.
