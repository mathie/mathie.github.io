---
layout: post
status: publish
published: true
title: ! 'Solaris: Logging to a separate loghost, the easy way'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 442
wordpress_url: http://woss.name/2007/06/17/solaris-logging-to-a-separate-loghost-the-easy-way/
date: 2007-06-17 10:20:38.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 888
  author: Russ Sanderlin
  author_email: rsanderlin@tearstone.com
  author_url: http://tearstone.com
  date: !binary |-
    MjAwOC0wMi0wMSAxMjoyNjo1NCArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMi0wMSAxMjoyNjo1NCArMDAwMA==
  content: <p>Good write up. Primarily I'm a Linux administrator and I was wondering
    how to set this up more efficiently in Solaris.<&#47;p>
- id: 889
  author: Mel
  author_email: melvinjbriggs@bellsouth.net
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0yNyAwMzowNDoyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yNyAwMjowNDoyOSArMDEwMA==
  content: <p>In the ifdef statement for auth.debug, will the messages be logged to
    "&#47;var&#47;log&#47;authlog" on the local host, or is "&#47;var&#47;log&#47;authlog"
    the target log file on the remote "@loghost" computer? In other words will the
    local host computer record these messages as well as the remote loghost host?
    Or will the local host not receive these auth.debug (and higher) messages and
    instead all of them are sent to the &#47;var&#47;log&#47;authlog file on the remote
    loghost computer?<&#47;p>
- id: 890
  author: How to configure central syslog&#8217;ing on Solaris &laquo; sonia hamilton
    - life on the digital bikepath - sonia@snowfrog.net
  author_email: ''
  author_url: http://soniahamilton.wordpress.com/2008/10/07/how-to-configure-central-sysloging-on-solaris/
  date: !binary |-
    MjAwOC0xMC0wNyAwMTo0Nzo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0wNyAwMDo0Nzo0NyArMDEwMA==
  content: ! '<p>[...] How to configure central syslog&#8217;ing on&nbsp;Solaris Filed
    under: Solaris &#8212; Sonia @ 11:47 am   Quick notes; see Solaris: Logging to
    a separate loghost, the easy way. [...]<&#47;p>'
---
I had a little difficulty Googling for this one, so I thought I'd share.  I'm sure you've all seen the following in `&#47;etc&#47;syslogd.conf` on Solaris:

    auth.debug                      ifdef(`LOGHOST', &#47;var&#47;log&#47;authlog, @loghost)

and wondered how `LOGHOST` gets defined so that you get to change the behaviour with minimum effort.  Well, I think I've finally figured it out.  By default, in `&#47;etc&#47;inet&#47;hosts` and `&#47;etc&#47;inet&#47;ipnodes` your local machine is given the alias `loghost`.  It would appear that if you assign this alias to another host, it will receive the log messages instead.  So, on one of my zones, I now have the hosts file:

    #
    # Internet host table
    #
    127.0.0.1       localhost
    213.166.22.198  tobermory.rubaidh.com
    213.166.22.196  kilchoman.rubaidh.com   loghost

Save that, and make the equivalent changes to `&#47;etc&#47;inet&#47;ipnodes` too, if necessary.  Now restart syslog in the zone:

    mathie@tobermory:~$ pfexec svcadm restart system-log

and it will log the appropriate messages to the remote machine.  FWIW, I've also made a change to the default `syslog.conf` file on all my hosts.  The relevant lines are:

    auth.debug                      ifdef(`LOGHOST', &#47;var&#47;log&#47;authlog, @loghost)
    *.debug;auth.none               ifdef(`LOGHOST', &#47;var&#47;log&#47;syslog, @loghost)

That way *all* syslog messages get logged, either to `&#47;var&#47;log&#47;syslog` for the most part, or to `&#47;var&#47;log&#47;authlog` for authentication-related messages.  That's just a more familiar personal preference for me, coming from Debian GNU&#47;Linux et al.  If you're going to follow those changes too, restart your syslogd server now for them to take effect.  Finally, we'll just test that things are working.  First of all, open up a shell on the log server and tail the log we set everything to go to:

    mathie@kilchoman~$ tail -f &#47;var&#47;log&#47;syslog

Now, on the other host that's logging elsewhere, generate a log message.  You could try something along the lines of:

    mathie@tobermory:~$ logger -p notice "Hello from tobermory"

and note that, a mere few seconds later, it appears on the other log:

    Jun 17 10:16:57 tobermory.rubaidh.com mathie: [ID 702911 user.notice] Hello from tobermory

Excellent!

As an aside -- and this is slightly out of order because you should have sorted out the log server first! -- you can set your log host to listen for remote log messages by doing the following:

    mathie@kilchoman~$ pfexec svccfg -s svc:&#47;system&#47;system-log setprop config&#47;log_from_remote = true
    mathie@kilchoman~$ pfexec svcadm refresh svc:&#47;system&#47;system-log
