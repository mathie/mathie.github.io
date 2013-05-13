---
layout: post
title: Tracking multiple revisions in subversion when disconnected
date: 2006-10-09 14:28:49 +01:00
categories:
- Geekery
tags:
- Geekery
---
This should be in the 'Well, duh!' category, but I'd never thought of it before, so I thought I'd share it.  I'm currently in the train between Edinburgh and London, and I'm too cheap to pay for the Wifi access.  Actually, that's not the whole story.  I kinda *like* the disconnectedness because it allows me to focus on some serious coding in peace and quiet -- something Mail.app rarely lets me do.

Anyway, one of the disadvantages is that I don't have access to the Subversion repositories of the projects I'm working on right now.  And I like to be good about committing chunks of changes that are related together, *while not committing disparate changes in one chunk*.  That's kinda difficult, since one of the changes I've just made is to fix up the she-bangs on a bunch of scripts and mark the `svn:executable` property on them.  So.  How do I maintain all these separate changes until I get 'net access and I can commit them in sequence?

Umm, `tar`.  Every time I get to a stage where I want to commit, I create a file in the top-level of the project, conveniently called `svn-commit.tmp`.  I then move to the parent folder and do:

    mathie@laphroaig:svn$ tar zcf ${project}-r${rev}.tar.gz ${project}

where `${project}` is the folder name of the project I'm working on (which in my case actually contains 3 separate svn repositories but that decision was long before my time and anyway, the wench is dead) and `${rev}` is an incrementing revision number to keep track of the order of commits.

When I get 'net access again, the actual commit stage will be along the lines of creating a temporary folder to untar each in turn, change into the created folder, run `svn commit -F svn-commit.tmp` and remove the folder again.  I suspect that for all but the first, there will be an `svn up` stage too which will show a bunch of changes in the `G` state (basically noting the same change having been made locally and remotely) before subversion will allow the commit to happen.

And now a regularly scheduled moan.  Why is it that every time I've taken the train between Edinburgh and London this year, I wind up with an airline seat facing backwards, even if I book months in advance?  I don't mind the airline seat, but I *really* don't like not facing the direction I'm travelling in...  This time I'm in seat 01 which is a mixed bag.  On the plus side, there's lots more legroom.  On the minus side, the pneumatically opened door between carriages is directly behind me and the hissing noise is already driving me loopy!  Still, only 4h10 to go...
