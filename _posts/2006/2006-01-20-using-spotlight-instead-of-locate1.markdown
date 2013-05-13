---
layout: post
status: publish
published: true
title: Using Spotlight instead of locate(1)
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 223
wordpress_url: http://woss.name/2006/01/20/using-spotlight-instead-of-locate1/
date: 2006-01-20 13:10:15.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 259
  author: Mike Quin
  author_email: mike@elite.uk.com
  author_url: http://www.elite.uk.com/mike/
  date: !binary |-
    MjAwNi0wMS0yMCAxNzo1MDo1OCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0yMCAxNjo1MDo1OCArMDAwMA==
  content: <p>Why would you need to emulate find(1) when MacOS has it already (at
    least jaguar does, anyway).<&#47;p>
- id: 260
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMS0yMCAxODoyMToyMSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0yMCAxNzoyMToyMSArMDAwMA==
  content: ! '<p>Mike: Because using Spotlight would be far faster, and potentially
    more flexible.<&#47;p>'
---
Being a *nix weenie of old, I'm used to using `locate(1)` to search for files on my filesystem.  Unfortunately, on Mac OS X, that doesn't work so well, since the locate database isn't automatically updated.  Previously I'd been manually updating the locate database every so often, mostly at the point where I wanted to locate something!

Today I came up with a better plan: [Spotlight](http:&#47;&#47;www.apple.com&#47;macosx&#47;features&#47;spotlight&#47;).  Recently I'd been reading up on the use of `mdfind` to drive Spotlight from the command line, which is kinda neat, but the language for telling it what you're looking for, while extremely flexible, is a bit long winded.  So the following has just made it into my `~&#47;.bashrc`:

    # Let's emulate locate with Spotlight's mdfind
    locate()
    {
        mdfind "kMDItemFSName = '*$@*'"
    }

And it works really nicely:

    mathie@tandoori:mathie$ locate tsearch2
    &#47;opt&#47;local&#47;lib&#47;pgsql8&#47;tsearch2.so
    &#47;opt&#47;local&#47;share&#47;postgresql8&#47;contrib&#47;tsearch2.sql
    &#47;opt&#47;local&#47;share&#47;postgresql8&#47;contrib&#47;untsearch2.sql

Of couse, this particular 10 minute digression from what I was actually trying to find is just as bad as waiting for the locate database to be regenerated, but at least it's a one-off; now I can rely on typing `locate foo` knowing that it will work quickly, and produce current (up to the second!) results.

Next up is to emulate `find(1)`, which should be easy enough (all the right metadata is there), but I'll need to do something a bit smarter to emulate find's command line arguments.
