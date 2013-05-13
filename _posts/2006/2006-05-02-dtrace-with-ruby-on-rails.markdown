---
layout: post
title: DTrace with Ruby on Rails
date: 2006-05-02 09:50:16 +01:00
categories:
- Geekery
- Web surfing
- Work
---
OK, this is one of these reminders that it's worth persevering with getting used to SPARC/Solaris: [DTrace on Rails](http://blogs.sun.com/roller/page/bmc?entry=dtrace_on_rails).  I really haven't looked into [DTrace](http://opensolaris.org/os/community/dtrace/) yet, but it looks like a stupendously wonderful mechanism for doing performance analysis.

And just wait 'til I start telling you all about [ZFS](http://opensolaris.org/os/community/zfs/).  It's incredible.  And [Zones](http://opensolaris.org/os/community/zones/)?  Well, I'm still trying to get my head around them a bit (in particular, I'd like to create zones with minimal package lists, and I've figured that I can create 'full root zones', but I can't see how not to populate them with the full set of packages from the host system immediately), but they look like a great way to segment functionality into separate conceptual boxes.

Anyway, I should sort through my notes from the last week's fiddling and post them here, but I just couldn't resist mentioning dtrace on rails...
