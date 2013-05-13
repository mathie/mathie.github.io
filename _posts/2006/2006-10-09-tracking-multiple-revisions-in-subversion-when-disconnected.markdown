---
layout: post
status: publish
published: true
title: Tracking multiple revisions in subversion when disconnected
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-10-09 14:28:49.000000000 +01:00
categories:
- Geekery
tags:
- Geekery
comments:
- id: 607
  author: Derek Ross
  author_email: derek@drossy.net
  author_url: http://www.drossy.net/blog
  date: !binary |-
    MjAwNi0xMC0wOSAxNToyNDozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wOSAxNDoyNDozNiArMDEwMA==
  content: <p>I haven't really looked at this stuff closely, but isn't this basically
    the use case that svk exists to solve?</p>
- id: 608
  author: Labrat
  author_email: richstyles@gmail.com
  author_url: http://blog.labratz.net
  date: !binary |-
    MjAwNi0xMC0xMCAwMjoyNDoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAwMToyNDoyMiArMDEwMA==
  content: ! '<p>I was about to make the exact same comment as above.  Once you have
    an svk mirror it''s a couple steps.</p>


    <p>svk mkdir //local

    svk cp //mirror/myproj //local/myproj

    svk co //local/myproj  local_folder</p>


    <p>Before you hop the train:

    local_folder$   svk pull</p>


    <p>commit like any other:

    svk ci -m "whatever"</p>


    <p>when you get connected again:

    svk pull   #resolves any conflicts with smerge

    svk push --verbatim  #makes each local commit to the main repository, with individual
    commit messages</p>


    <p>I''m typing from memory but that should be more or less accurate.</p>


    <p>It also serves as a good backup (provided you sync regularly) if your main
    subversion goes down for any reason.</p>'
- id: 609
  author: Nathaniel Talbott
  author_email: nathaniel@talbott.ws
  author_url: http://talbott.ws/
  date: !binary |-
    MjAwNi0xMC0xMCAwMjo0NTozMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAwMTo0NTozMSArMDEwMA==
  content: ! '<p>You''ve done it - I now love svk even more for having seen an alternative
    ;-)</p>


    <p>Seriously, even though it''s a bit overcomplicated, making the learning curve
    a bit steep, svk is the bee''s knees if you need to do disconnected development
    and/or contribute to projects for which you don''t have commit privileges. And
    what developer hasn''t needed to do one or the other of those at some point?</p>'
- id: 610
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0xMCAwOTowMToyOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAwODowMToyOCArMDEwMA==
  content: ! '<p>OK, this post really was in the ''well, duh!'' category!  Yes, having
    investigated svk a little more, I see it is the answer to all my problems.  Oops.</p>


    <p>The major disconnect I had with svk was that I didn''t realise it talked directly
    to vanilla upstream subversion repositories -- for some reason I imagined it had
    its own master repository and I wasn''t prepared to make the switch from subversion
    just yet.</p>


    <p>I''ll be using svk on the train on the way back home. :-)</p>'
- id: 611
  author: Brian Ewins
  author_email: brian.ewins@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0xMiAyMzowMjo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMiAyMjowMjo1MSArMDEwMA==
  content: ! '<p>There''s another alternative to svk for this - bzr-svn:

    http://bazaar-vcs.org/BzrForeignBranches/Subversion</p>


    <p>It''s interesting, if a bit alpha.</p>'
---
This should be in the 'Well, duh!' category, but I'd never thought of it before, so I thought I'd share it.  I'm currently in the train between Edinburgh and London, and I'm too cheap to pay for the Wifi access.  Actually, that's not the whole story.  I kinda *like* the disconnectedness because it allows me to focus on some serious coding in peace and quiet -- something Mail.app rarely lets me do.

Anyway, one of the disadvantages is that I don't have access to the Subversion repositories of the projects I'm working on right now.  And I like to be good about committing chunks of changes that are related together, *while not committing disparate changes in one chunk*.  That's kinda difficult, since one of the changes I've just made is to fix up the she-bangs on a bunch of scripts and mark the `svn:executable` property on them.  So.  How do I maintain all these separate changes until I get 'net access and I can commit them in sequence?

Umm, `tar`.  Every time I get to a stage where I want to commit, I create a file in the top-level of the project, conveniently called `svn-commit.tmp`.  I then move to the parent folder and do:

    mathie@laphroaig:svn$ tar zcf ${project}-r${rev}.tar.gz ${project}

where `${project}` is the folder name of the project I'm working on (which in my case actually contains 3 separate svn repositories but that decision was long before my time and anyway, the wench is dead) and `${rev}` is an incrementing revision number to keep track of the order of commits.

When I get 'net access again, the actual commit stage will be along the lines of creating a temporary folder to untar each in turn, change into the created folder, run `svn commit -F svn-commit.tmp` and remove the folder again.  I suspect that for all but the first, there will be an `svn up` stage too which will show a bunch of changes in the `G` state (basically noting the same change having been made locally and remotely) before subversion will allow the commit to happen.

And now a regularly scheduled moan.  Why is it that every time I've taken the train between Edinburgh and London this year, I wind up with an airline seat facing backwards, even if I book months in advance?  I don't mind the airline seat, but I *really* don't like not facing the direction I'm travelling in...  This time I'm in seat 01 which is a mixed bag.  On the plus side, there's lots more legroom.  On the minus side, the pneumatically opened door between carriages is directly behind me and the hissing noise is already driving me loopy!  Still, only 4h10 to go...
