---
layout: post
title: ! 'RailsConf Europe 2006: Rails: A system view -- Jason Hoffman'
date: 2006-10-02 10:04:02 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
---
> This is the fifth in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

Rails is a small part of the whole stack. A *really* small part. One of
Jason's slides talked about all the daemons and services required for their
connector application. The list went to about 30 items. The rails application
was in at number 21.

Joyent has an opinionated view of hardware: they only use one type of each
thing. One type of console server, one type of disk subsystem, one type of
network switch, even down to only using one type of power plug.

Their load-balanced web setup is a redundant pair of F5 6400 hardware load
balancers with a RAM cache, talking directly to `mongrel_rails` instances.

Jason then went on to talk about how fantastic Solaris 11 is, including its
support for zones & containers (virtualisation, which he considers to be
absolutely essential for scalable, efficient use of hardware), dtrace and ZFS.
I didn't write any notes on these bits because it was nothing new to me, but I
think I am now also a Joyent Fanboy, mostly because their opinion of Solaris
matches mine. :-) Look out for Joyent releasing their work on dtrace for ruby
soon.
