---
layout: post
title: ! 'Solaris: Logging to a separate loghost, the easy way'
date: 2007-06-17 10:20:38 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
---
I had a little difficulty Googling for this one, so I thought I'd share.  I'm sure you've all seen the following in `/etc/syslogd.conf` on Solaris:

    auth.debug                      ifdef(`LOGHOST', /var/log/authlog, @loghost)

and wondered how `LOGHOST` gets defined so that you get to change the behaviour with minimum effort.  Well, I think I've finally figured it out.  By default, in `/etc/inet/hosts` and `/etc/inet/ipnodes` your local machine is given the alias `loghost`.  It would appear that if you assign this alias to another host, it will receive the log messages instead.  So, on one of my zones, I now have the hosts file:

    #
    # Internet host table
    #
    127.0.0.1       localhost
    213.166.22.198  tobermory.rubaidh.com
    213.166.22.196  kilchoman.rubaidh.com   loghost

Save that, and make the equivalent changes to `/etc/inet/ipnodes` too, if necessary.  Now restart syslog in the zone:

    mathie@tobermory:~$ pfexec svcadm restart system-log

and it will log the appropriate messages to the remote machine.  FWIW, I've also made a change to the default `syslog.conf` file on all my hosts.  The relevant lines are:

    auth.debug                      ifdef(`LOGHOST', /var/log/authlog, @loghost)
    *.debug;auth.none               ifdef(`LOGHOST', /var/log/syslog, @loghost)

That way *all* syslog messages get logged, either to `/var/log/syslog` for the most part, or to `/var/log/authlog` for authentication-related messages.  That's just a more familiar personal preference for me, coming from Debian GNU/Linux et al.  If you're going to follow those changes too, restart your syslogd server now for them to take effect.  Finally, we'll just test that things are working.  First of all, open up a shell on the log server and tail the log we set everything to go to:

    mathie@kilchoman~$ tail -f /var/log/syslog

Now, on the other host that's logging elsewhere, generate a log message.  You could try something along the lines of:

    mathie@tobermory:~$ logger -p notice "Hello from tobermory"

and note that, a mere few seconds later, it appears on the other log:

    Jun 17 10:16:57 tobermory.rubaidh.com mathie: [ID 702911 user.notice] Hello from tobermory

Excellent!

As an aside -- and this is slightly out of order because you should have sorted out the log server first! -- you can set your log host to listen for remote log messages by doing the following:

    mathie@kilchoman~$ pfexec svccfg -s svc:/system/system-log setprop config/log_from_remote = true
    mathie@kilchoman~$ pfexec svcadm refresh svc:/system/system-log
