---
layout: post
title: NetBSD Ports Collection (aka pkgsrc) available for Solaris
date: 2006-05-23 11:25:20 +01:00
categories:
- Geekery
- Solaris
- Work
---
Yesterday I discovered that [pkgsrc](http://www.netbsd.org/Documentation/software/packages.html), [NetBSD's](http://www.netbsd.org/) ports collection, is available for multiple platforms, not just NetBSD.  It's a mature, well developed packaging system with all the bells and whistles you'd expect from a source-based one.  In fact, it's much shinier than [DarwinPorts](http://darwinports.opendarwin.org/), IMHO and better than I remember [FreeBSD's](http://www.freebsd.org/) ports collection to be.  So far it's been a joy to use.

So why have I been using it?  Well, it's supported on Solaris, so I can use it on the T2000 I'm evaluating.  At last, I think I've settled upon a method for getting packages installed in a maintainable, upgradable, low-cost manner.  I've got a ZFS pool mounted on `/usr/pkg`, the source sitting in `/usr/pkg/src` and things are whizzing by, installing as we speak.

I've configured what I understand to be reasonable compiler flags for building performant code (which, after all, is the whole point of one of these beasties to me!).  So, in `/usr/pkg/etc/mk.conf`, we have:

    PKGSRC_COMPILER=sunpro
    CFLAGS=-fast -xarch=v9 -xtarget=ultraT1

using Sun Studio 11 with some flags to optimise for the target machine I'm using.  I hope that all works out nicely...

As an aside, why do all the [OpenSolaris](http://www.opensolaris.org/) documents refer to Studio 10, rather than 11?  Is it just that they haven't been updated, or are there issues with using Studio 11 that make 10 preferable?
