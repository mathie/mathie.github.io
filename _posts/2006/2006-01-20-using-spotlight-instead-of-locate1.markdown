---
layout: post
title: Using Spotlight instead of locate(1)
date: 2006-01-20 13:10:15 +00:00
categories:
- Geekery
---
Being a \*nix weenie of old, I'm used to using `locate(1)` to search for files on my filesystem.  Unfortunately, on Mac OS X, that doesn't work so well, since the locate database isn't automatically updated.  Previously I'd been manually updating the locate database every so often, mostly at the point where I wanted to locate something!

Today I came up with a better plan: [Spotlight](http://www.apple.com/macosx/features/spotlight/).  Recently I'd been reading up on the use of `mdfind` to drive Spotlight from the command line, which is kinda neat, but the language for telling it what you're looking for, while extremely flexible, is a bit long winded.  So the following has just made it into my `~/.bashrc`:

    # Let's emulate locate with Spotlight's mdfind
    locate()
    {
        mdfind "kMDItemFSName = '*$@*'"
    }

And it works really nicely:

    mathie@tandoori:mathie$ locate tsearch2
    /opt/local/lib/pgsql8/tsearch2.so
    /opt/local/share/postgresql8/contrib/tsearch2.sql
    /opt/local/share/postgresql8/contrib/untsearch2.sql

Of couse, this particular 10 minute digression from what I was actually trying to find is just as bad as waiting for the locate database to be regenerated, but at least it's a one-off; now I can rely on typing `locate foo` knowing that it will work quickly, and produce current (up to the second!) results.

Next up is to emulate `find(1)`, which should be easy enough (all the right metadata is there), but I'll need to do something a bit smarter to emulate find's command line arguments.
