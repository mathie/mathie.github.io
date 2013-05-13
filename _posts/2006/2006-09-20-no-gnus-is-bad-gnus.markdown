---
layout: post
title: No gnus is bad gnus
date: 2006-09-20 14:20:37 +01:00
categories:
- Geekery
tags:
- carbon-xemacs
- Geekery
- gnus
- home-directory
- subversion
- usenet
- xemacs
---
As an addendum to my post about [Keeping track of mailing lists](http://woss.name/2006/09/19/keeping-track-of-mailing-lists/), despite everybody's suggestions about using Gmail, I've decided to try using [Gnus](http://gnus.org/) in [XEmacs](http://www.xemacs.org/) again.  Last night, I built 21.5.26 with [Andrew Choi's carbon patches](http://members.shaw.ca/akochoi-xemacs/), installed the latest sumo packages and tried it out.

My fingers strangely still remember a number of the shortcuts, so it wasn't an altogether painful experience.  In fact, my fingers still remember a bunch of the stuff I'd set up myself, that I miss, so I'm now digging through my subversion-backed home directory's history to find my old gnus configuration.

I feel it helps to have a separate application for mailing lists, because it is very much a separate task (or context?) to reading email.  It's something I only want to do once or twice a day, when I've got a little downtime or am looking for a distraction.

Incidentally, I previously [built a binary for XEmacs](http://woss.name/2005/08/04/build-of-carbon-xemacs-21520-beta-2-for-mac-os-x-104/) and now that I'm using it again, I'd be happy to knock a more up to date one together if there was any demand for such a thing?

One other thing.  I don't suppose anybody around here still happens to run a usenet news server these days?  I'd like access to `comp.lang.ruby` and I'd quite like to reacquaint myself with another couple of groups I used to hang around in...

**update** And this is why one keeps one's home directory in subversion:

    mathie@Lagavulin:mathie$ svn log -v|less

to discover in which revision I removed the XEmacs configuration, then:

    mathie@Lagavulin:mathie$ svn merge -r1358:1357 .

and it restores all my config.  OK, so there are a couple of conflicts to resolve, but that was really quite painless. :-)
