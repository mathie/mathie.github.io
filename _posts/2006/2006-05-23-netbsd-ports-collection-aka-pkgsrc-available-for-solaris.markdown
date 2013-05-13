---
layout: post
status: publish
published: true
title: NetBSD Ports Collection (aka pkgsrc) available for Solaris
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 275
wordpress_url: http://woss.name/2006/05/23/netbsd-ports-collection-aka-pkgsrc-available-for-solaris/
date: 2006-05-23 11:25:20.000000000 +01:00
categories:
- Geekery
- Solaris
- Work
tags: []
comments:
- id: 468
  author: Peter Tribble
  author_email: peter.tribble@gmail.com
  author_url: http://ptribble.blogspot.com/
  date: !binary |-
    MjAwNi0wNS0yMyAxNjo0MDoyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yMyAxNTo0MDoyMyArMDEwMA==
  content: ! '<p>OpenSolaris itself is built with Studio 10 - and not just any Studio
    10, but Studio 10 with a very specific set of patches. The kernel can be very
    sensitive to compiler changes, so it takes a while for a new compiler to be checked
    out and any bugs (in the kernel or the compiler) fixed, but at some point OpenSolaris
    will transition to being built with Studio 11.<&#47;p>


    <p>I haven''t hit any problems with Studio 11 myself, but then I''m not messing
    with critical code.<&#47;p>'
- id: 469
  author: Charles H.
  author_email: I_dont_want@to_mail_with_you.org
  author_url: ''
  date: !binary |-
    MjAwNi0wNi0yMCAxOTo1MjowNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yMCAxODo1MjowNyArMDEwMA==
  content: ! '<p>Yeah last time I tried to build opensolaris (200605xx) with sun studio
    11, it failed very early while building the kernel; I''ve also checked #opensolaris@freenode
    and they told me that building opensolaris with studio11 isn''t supported yet.<&#47;p>


    <p>I also had problems bootstrapping pkgsrc with studio 11, studio 10 was fine,
    though.<&#47;p>'
---
Yesterday I discovered that [pkgsrc](http:&#47;&#47;www.netbsd.org&#47;Documentation&#47;software&#47;packages.html), [NetBSD's](http:&#47;&#47;www.netbsd.org&#47;) ports collection, is available for multiple platforms, not just NetBSD.  It's a mature, well developed packaging system with all the bells and whistles you'd expect from a source-based one.  In fact, it's much shinier than [DarwinPorts](http:&#47;&#47;darwinports.opendarwin.org&#47;), IMHO and better than I remember [FreeBSD's](http:&#47;&#47;www.freebsd.org&#47;) ports collection to be.  So far it's been a joy to use.

So why have I been using it?  Well, it's supported on Solaris, so I can use it on the T2000 I'm evaluating.  At last, I think I've settled upon a method for getting packages installed in a maintainable, upgradable, low-cost manner.  I've got a ZFS pool mounted on `&#47;usr&#47;pkg`, the source sitting in `&#47;usr&#47;pkg&#47;src` and things are whizzing by, installing as we speak.

I've configured what I understand to be reasonable compiler flags for building performant code (which, after all, is the whole point of one of these beasties to me!).  So, in `&#47;usr&#47;pkg&#47;etc&#47;mk.conf`, we have:

    PKGSRC_COMPILER=sunpro
    CFLAGS=-fast -xarch=v9 -xtarget=ultraT1

using Sun Studio 11 with some flags to optimise for the target machine I'm using.  I hope that all works out nicely...

As an aside, why do all the [OpenSolaris](http:&#47;&#47;www.opensolaris.org&#47;) documents refer to Studio 10, rather than 11?  Is it just that they haven't been updated, or are there issues with using Studio 11 that make 10 preferable?
