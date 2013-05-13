---
layout: post
title: Some new git techniques for your arsenal
date: 2008-04-12 16:45:56 +01:00
categories:
- Geekery
- Ruby and Rails
- Software Configuration Management
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
