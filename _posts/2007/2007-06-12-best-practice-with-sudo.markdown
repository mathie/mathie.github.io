---
layout: post
title: Best Practice with sudo
date: 2007-06-12 10:31:24 +01:00
categories:
- Geekery
- Work
tags:
- Geekery
- Work
comments:
- id: 876
  author: Chris J
  author_email: cpj1@visi.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0xMiAxNjo1ODo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMiAxNTo1ODo1NyArMDEwMA==
  content: ! '<p>I never considered sudo to be a replacement for opening a root shell,
    or performing root administrative tasks.</p>


    <p>To me, sudo is a secure gateway to root access made for operators that only
    have specific tasks, such as changing a backup tape or controlling a web server
    process.  Unfortunately, many admins never restrict the allowed commands for sudo,
    leading to a false sense of security.</p>


    <p>Ironically, the RBAC configurations that ship with Solaris provide a good framework
    for operator roles that sudo could closely match.</p>'
- id: 877
  author: Kisin
  author_email: jjm@ixtab.org.uk
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0xMiAxNzowOToyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMiAxNjowOToyOSArMDEwMA==
  content: ! '<p>It''s possible to prevent sudo -s (getting shells via over programs,
    such as emacs/vim) by using the NOEXEC configuration option in sudoers. However
    you''ll need to get a good list of the shell and  perl stuff you need to run with
    exec or you''ll not be able to call reboot.</p>


    <p>At least on Debian (sarge/woody) there''s some files missing that prevent it
    from working. Sudo with NOEXEC sending to a remote syslog server(s) and then into
    Splunk do make a good way of recording everything that is run as root on a host.</p>'
- id: 878
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNi0xNCAxMDozMjo0MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xNCAwOTozMjo0MCArMDEwMA==
  content: ! '<p>To be honest, with most of the systems I run, I am the only one who
    runs them (If I get run over by a bus, a whole pile of people are in trouble,
    but frankly that''ll be the least of my worries!) so my account has the ability
    to <code>sudo</code> to root without any restrictions.  A few other people do
    have restricted sudo for particular commands on particular hosts (eg one account
    which can restart zope daemons running as another user).</p>


    <p>So, yeah, that''s the scenario from which my observations occurred.</p>


    <p>kisin: I hadn''t looked into noexec before.  It sounds way too much like hard
    work to set up for the particular system I''m implementing.  Basically, there
    are three of us with the ability to sudo to root.  And if I catch anybody doing
    <code>sudo -s</code> I''ll hit them with a big stick.  Sometimes that''s the best
    way of enforcing rules. :-)</p>'
- id: 879
  author: Kisin
  author_email: jjm@ixtab.org.uk
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0xNiAwOTo0NTozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xNiAwODo0NTozNiArMDEwMA==
  content: <p>The NOEXEC stuff is OTT, however if you start handling card data it'll
    be a requirement for getting PCI.</p>
---
I just found this lecture in some documentation I'd been writing for a client.  Clearly I was running through an install, documenting it as I go along, and was filling in time while something happened.  Anyway, I thought I'd share it here:

> As a side note, before I go on, let's have some best-practice
> discussion about doing things as root. Since you can't log in directly as root on Ubuntu installs,
> you always log in with your own user name and use sudo to gain root
> access. This way we get a log entry, along the lines of:
>
>     Apr 6 09:38:36 cluedo sudo: cl_mustard : TTY=pts/0 ; \
>     PWD=/home/library ; USER=prof_plum ; \
>     COMMAND=/bin/kill --with lead_pipe mrs_white
>
> So we see:
>
> * When something happened (April 6th, at 9:38AM).
> * Who did it (cl_mustard).
> * Where they were (/home/library).
> * Who they masqueraded as (prof_plum).
> * The command they ran (/bin/kill --with lead_pipe mrs_white).
>
> In order for this to work, I need to **ban** the use of the following
> two commands:
>
> * `sudo -s`
> * `sudo su -`
>
> which I often used to see in the [Tardis](http://www.tardis.ed.ac.uk/) logs. When you do this, the
> system logs no longer show what you were up to so we lose our audit
> trail.  Unfortunately, it's pretty much impossible to effectively stop folks doing
> this, so I'm just saying: **don't do it!** Always do `sudo -u <user>
> <command>` to make it explicit what you're doing!
>
> On the downside,
> there are also some situations where it's necessary to do `sudo -s` --
> for example when you want to look at file where you don't have read
> permission in the directory, but you can't remember the name of the
> file!)

So there you go.  That's how I believe you should use sudo.  One of these days I ought to figure out how to make the RBAC stuff in Solaris log stuff in a similar manner.  I seem to recall getting as far as running `bsmconv` & rebooting, then getting distracted by something else...
