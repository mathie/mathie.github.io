---
layout: post
status: publish
published: true
title: DTrace with Ruby on Rails
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 263
wordpress_url: http://woss.name/2006/05/02/dtrace-with-ruby-on-rails/
date: 2006-05-02 09:50:16.000000000 +01:00
categories:
- Geekery
- Web surfing
- Work
tags: []
comments:
- id: 412
  author: John Levon
  author_email: levon@movementarian.org
  author_url: http://blogs.sun.com/levon
  date: !binary |-
    MjAwNi0wNS0wMiAxMzozMjoyNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0wMiAxMjozMjoyNyArMDEwMA==
  content: <p>I'm a bit confused by the "SPARC/Solaris" comment. Of course, all of
    these features are available on both x86 and SPARC, there's no requirement to
    use a SPARC machine for any of this.</p>
- id: 413
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNS0wMiAxMzozNTo0NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0wMiAxMjozNTo0NiArMDEwMA==
  content: ! '<p>John: Ah, what I really mean is that I''m getting used to both the
    SPARC platform and Solaris 10.  Having been a Mac OS X weenie for the past few
    years I don''t actually have any x86 hardware I could run Solaris on!</p>'
- id: 414
  author: Mike Quin
  author_email: mike@elite.uk.com
  author_url: http://www.elite.uk.com/mike/
  date: !binary |-
    MjAwNi0wNS0wMiAxNDoxNToyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0wMiAxMzoxNToyNCArMDEwMA==
  content: <p>How are you finding Zones? I had a very breif look at them when Solaris
    10 was released and while the techology looked neat the management tools appeared
    to be completely unweildy compared to other virtualisation systems.</p>
- id: 415
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNS0wMyAwOTozODozMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0wMyAwODozODozMCArMDEwMA==
  content: ! '<p>Mike: I haven''t looked at zones in much detail yet, and I haven''t
    actually used any other virtualisation systems in anger (well, apart from Virtual
    PC on my Mac, but that''s not quite in the same league).  I''ll write up a post
    from my notes this evening, though.  In short, it doesn''t seem as flexible as
    I''m looking for in terms of creating locked down, minimal zones with only a particular
    set of packages, but it''s <em>really</em> easy to create new zones, deploy and
    manage them.</p>


    <p>And it''s really weird to be running on a zone console inside the global zone
    console inside the OpenBoot console inside the ALOM console. :)</p>'
- id: 416
  author: SDave
  author_email: dmd2896@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNi0yOSAyMTo1NzoyNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yOSAyMDo1NzoyNyArMDEwMA==
  content: ! '<p>Yeah, Zones are so easy to use its scary, and the nested levels of
    prompts are really fun.  I rebooted my workstation accidentally last week by being
    in the wrong window!</p>


    <p>I thought it was funny when someone talked about IBMs "virtual" servers that
    require a copy of the OS for each partition?  Thats not virtual servers, thats
    domains, Sun''s been doing that for a long long time.  Solaris 10 zones are somewhat
    more robust implementation of BSD jails.  The separate namespace, security, and
    network for each zone make consolidation and segmentation so much easier, without
    the cost and hassle of another OS instance to manage.</p>


    <p>If you create a sparse zone, the packages are shared with the zone read only
    via loopback mounts, and that should only be a minimal set of pakages, you can
    tweak the package set somewhat.</p>


    <p>DTrace makes troubleshooting, especially with performance issues, really really
    cool.  Watching the system calls live, trapping for certain behaviours, it makes
    the admins job much easier, and its nice to be able to show the poor unsuspecting
    app developer exactly where his code is creating the slowdown.  Or you can write
    a D script to automatically re-issue the system call in a more appropriate manner
    if you want, all without needing the app source code, or even knowing exactly
    what it does.</p>'
---
OK, this is one of these reminders that it's worth persevering with getting used to SPARC/Solaris: [DTrace on Rails](http://blogs.sun.com/roller/page/bmc?entry=dtrace_on_rails).  I really haven't looked into [DTrace](http://opensolaris.org/os/community/dtrace/) yet, but it looks like a stupendously wonderful mechanism for doing performance analysis.

And just wait 'til I start telling you all about [ZFS](http://opensolaris.org/os/community/zfs/).  It's incredible.  And [Zones](http://opensolaris.org/os/community/zones/)?  Well, I'm still trying to get my head around them a bit (in particular, I'd like to create zones with minimal package lists, and I've figured that I can create 'full root zones', but I can't see how not to populate them with the full set of packages from the host system immediately), but they look like a great way to segment functionality into separate conceptual boxes.

Anyway, I should sort through my notes from the last week's fiddling and post them here, but I just couldn't resist mentioning dtrace on rails...
