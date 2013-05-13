---
layout: post
status: publish
published: true
title: Some new git techniques for your arsenal
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2008-04-12 16:45:56.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- Software Configuration Management
tags: []
comments:
- id: 1001
  author: tomtt
  author_email: messydesk@tomtenthij.nl
  author_url: http://tomtenthij.co.uk
  date: !binary |-
    MjAwOC0wNC0xMiAxODoxMjoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMiAxNzoxMjoxMSArMDEwMA==
  content: ! '<p>I also love:

    git-rebase --interactive HEAD~5</p>'
- id: 1002
  author: Scott
  author_email: scott@scottwalter.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0xMiAyMzoxMDoyOCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMiAyMjoxMDoyOCArMDEwMA==
  content: <p>Nice tips!  Keep them coming :-)</p>
- id: 1003
  author: Henrik N
  author_email: henrik@nyh.se
  author_url: http://henrik.nyh.se
  date: !binary |-
    MjAwOC0wNC0xNCAxMjoyMjoxNiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xNCAxMToyMjoxNiArMDEwMA==
  content: ! '<p>If you use three periods in your log (or diff), like "git log production...master",
    I think it will compare the most recent common ancestor of the branches (production
    and master in your example) with the head of the last branch (master). This can
    come in handy if there has been work done on both branches and you don''t want
    to compare the heads.</p>


    <blockquote>

    . This seems like a good reason to squash your commits when you merge them onto
    master; that way it’s easy to cherry pick particular complete features for deployment?
    Otherwise, you have to figure out which commits belong to a particular feature?

    </blockquote>


    <p>Another way is to merge the feature branch into the production branch just
    as you merged it into the master branch.</p>'
- id: 1004
  author: Christian Couder
  author_email: chriscool@tuxfamily.org
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0zMCAyMjo1ODowMiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0zMCAyMTo1ODowMiArMDEwMA==
  content: ! '<p>You say:</p>


    <p>"

    Here’s a command that I think is going to prove to be incredibly powerful, but
    I just haven’t quite figured out exactly how, yet:</p>


    <p>$ git bisect run rake

    "</p>


    <p>You need first to start bisection using for example:</p>


    <p>$ git bisect start  </p>


    <p>where  is a rev where your test suite is broken

    and  is a rev where it passes.</p>


    <p>Then you can launch for example:</p>


    <p>$ git bisect run rake test</p>


    <p>and enjoy :-)</p>'
- id: 1005
  author: Christian Couder
  author_email: chriscool@tuxfamily.org
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0wOCAxMzo1Nzo0NCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0wOCAxMjo1Nzo0NCArMDEwMA==
  content: ! '<p>Ok, I screw up, because I used &lt;stuff&gt; in my above message
    but the "&lt;" and "&gt;" disapeared.</p>


    <p>So I try it again:</p>


    <p>You need first to start bisection using for example:</p>


    <p>$ git bisect start &lt;badrev&gt; &lt;goodrev&gt;</p>


    <p>where &lt;badrev&gt; is a rev where your test suite is broken and &lt;goodrev&gt;
    is a rev where it passes.</p>


    <p>Then you can launch for example:</p>


    <p>$ git bisect run rake test</p>


    <p>and enjoy :-)</p>'
---
I may seem somewhat git-obsessed lately. That's probably because I am. It's
awesome. :-) But mostly it's because I have finally made the jump and I'm
having to re-learn the techniques I have been making use of for years in
subversion.

First up: looking at the changes between two branches. I often work with a
'master' branch, which is effectively the mainline development and it winds up
on the staging server(s) pretty quickly, sometimes instantaneously. And then
we have the production branch which contains the code that's in production.
So, how do I tell what is sitting on the master branch, waiting to be moved
into production? That's easy:

    mathie@tullibardine:books$ git log --stat production..master

which will give me a log (with pretty stats) of all the changes that are on
the master branch but not yet on production. This seems like a good reason to
squash your commits when you merge them onto master; that way it's easy to
cherry pick particular complete features for deployment? Otherwise, you have
to figure out which commits belong to a particular feature?

Next up: figuring out what you've committed to your local repository but not
yet pushed upstream. This has been kinda bugging me for a while -- I've got a
terrible memory, so I can't remember if I pushed my code upstream or just
committed it. By running:

    mathie@tullibardine:books$ git cherry -v origin
    + 7d556cfaafe8cf6023ee9cc6f189c788dfbbdf92 Spurious commit.

we get a list of the commits (and, with `-v`, the first line of the commit
message) that haven't yet been pushed up.

Finally: reversing an already committed change. We all make mistakes
sometimes. And I'm personally not a fan of rewriting history. As it is, you
can only safely rewrite history if you haven't shared your changes with
others. So, how do you reverse a particular commit that has turned out to be
bad? Like this:

    mathie@tullibardine:books$ git revert 7d556cf
    Removed foo
    Finished one revert.
    Created commit bf98f1b: Revert "Spurious commit."
     0 files changed, 0 insertions(+), 0 deletions(-)
     delete mode 100644 foo

which is the equivalent of `svn merge -c-42 && svn commit` which reverse
merges a particular change. I don't know if it says something about my style
of development, but I know that one well enough... :-)

Here's a command that I think is going to prove to be incredibly powerful, but
I just haven't quite figured out exactly how, yet:

    git bisect run rake

which will tell you the commit that broke the test suite, for when you're
working without CI (and an eejit on the team who doesn't run the test suite
before sharing his changes!).
