---
layout: post
status: publish
published: true
title: ! 'Sauce with Postfix Pt. 2: The solution'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 326
wordpress_url: http://woss.name/2003/10/16/sauce-with-postfix-pt-2-the-solution/
date: 2003-10-16 12:14:36.000000000 +01:00
categories:
- Geekery
tags:
- Geekery
comments: []
---
<p>Further to my previous entry <a href="http:&#47;&#47;www.endless.org.uk&#47;blog&#47;archives&#47;2003&#47;10&#47;16&#47;000463.html">Sauce with Postfix<&#47;a>, inspiration struck as to getting it to work.  I've implemented it locally and it appears to be functional, but I'd like somebody smart to go over my working (please just leave a comment here) before I even think of sending it in the general direction of Mr Jackson.  It should also be noted that these instructions are only tested on SAUCE version 0.7.14 and Postfix 2.0.16, both running on Debian Sarge.  I make no guarantees about it working with anything else at all.<&#47;p>

<p>Postfix allows you to run with an alternative configuration, by setting the <code>MAIL_CONFIG<&#47;code> environment variable to the name of a directory containing the configuration.  To complicate matters though, Postfix also ignores any UCE restrictions specified in the configuration unless the program is running as <code>$mail_owner<&#47;code>.  So, let's start by setting up an alternative Postfix configuration in <code>&#47;etc&#47;sauce<&#47;code>.  I copied my existing <code>main.cf<&#47;code> across and I will need to remember to keep the two copies in sync.  I guess the important parts are to keep the delivery and virtual configurations consistent.  (Maybe it would really be more sensible to have a minimal configuration which just passes the mail onto the real Postfix daemon, but I'll think about that more closely later.)<&#47;p>

<p>Anyway, the only change required to work correctly with SAUCE is to <em>remove<&#47;em> <code>permit_mynetworks<&#47;code> from <code>smtpd_recipient_restrictions<&#47;code>.  If you haven't explicitly specified that configuration option in your <code>&#47;etc&#47;sauce&#47;main.cf<&#47;code>, it should probably be set to:<&#47;p>

<pre>smtpd_recipient_restrictions = reject_unauth_destination<&#47;pre>

<p>This has the effect of no longer implicitly trusting connections from localhost (and so not allowing it to relay mail to other machines).  You will also have to add to your primary Postfix configuration (<code>&#47;etc&#47;postfix&#47;main.cf<&#47;code>) the following line:<&#47;p>

<pre>alternate_config_directories = &#47;etc&#47;sauce<&#47;pre>

<p>or it will get upset when we try to run with the alternative configuration.  In order to avoid warnings about the file being missing (and definitely if you use dynamic maps of some variety for virtual domain or alias lookups) you may want to symlink <code>&#47;etc&#47;postfix&#47;dynamicmaps.cf<&#47;code> into <code>&#47;etc&#47;sauce<&#47;code>.<&#47;p>

<p>Next up is to try and convince SAUCE to run <code>&#47;usr&#47;sbin&#47;sendmail<&#47;code> as the 'postfix' user, with the environment variable <code>MAIL_CONFIG=&#47;etc&#47;sauce<&#47;code>.  Fortunately SAUCE already depends on a neat piece of software called <a href="http:&#47;&#47;www.chiark.greenend.org.uk&#47;~ian&#47;userv&#47;">userv<&#47;a> which allows particular programs to be executed as another user.  So, using one of the existing configuration snippets as an example, I created <code>&#47;etc&#47;userv&#47;services.d&#47;sauce-postfix-sendmail<&#47;code> with the following:<&#47;p>

<pre>if ( glob calling-user mail
   & glob service-user postfix
   )
        suppress-args
        no-disconnect-hup
        execute &#47;usr&#47;share&#47;sauce&#47;postfix-sendmail
fi<&#47;pre>

<p>which should allow SAUCE to run the program <code>&#47;usr&#47;share&#47;sauce&#47;postfix-sendmail<&#47;code> as the 'postfix' user.  The program is just a straightforward shell script:<&#47;p>

<pre>#!&#47;bin&#47;sh

# I would write this in TCL to be consistent with the rest of SAUCE,
# but I'd have to understand TCL first...

# Source configuration
test -f &#47;etc&#47;sauce&#47;sys-config || exit 1
. &#47;etc&#47;sauce&#47;sys-config

exec &#47;usr&#47;sbin&#47;sendmail -bs<&#47;pre>

<p><code>&#47;etc&#47;sauce&#47;sys-config<&#47;code> now just has the extra line <code>MAIL_CONFIG=&#47;etc&#47;sauce; export MAIL_CONFIG<&#47;code> to tell sendmail where the Postfix configuration is.  We're nearly done.  All that's left is a small patch to SAUCE itself, namely:<&#47;p>

<pre>--- smtp~	2003-06-15 16:46:40.000000000 +0100
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

 config_var conns_max                 120    number	     1  10000<&#47;pre>

<p>Turn on the changes by adding <code>postfix_sendmail true<&#47;code> to <code>&#47;etc&#47;sauce&#47;config<&#47;code>.<&#47;p>

<p>That should do the job.  Restart SAUCE and irritate it until it's ecstatic with you.  You still lose some data from the Postfix logs (connections which happen through SAUCE will appear to have originated at localhost according to Postfix) so I would still be better off switching to somebody else's idea of the One True MTA, but at least SAUCE now behaves in the way one would expect.<&#47;p>
