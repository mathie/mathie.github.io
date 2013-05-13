---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: Javascript Testing -- Thomas Fuchs'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-10-03 15:07:38.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
comments:
- id: 601
  author: Boyd Adamson
  author_email: boyd-adamson@usa.net
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0wMyAyMjoxMDoyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wMyAyMToxMDoyOSArMDEwMA==
  content: ! '<p>What about dtrace for javascript?</p>


    <p>http://blogs.sun.com/brendan/entry/dtrace_meets_javascript</p>'
- id: 602
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0wNCAxMDowODozMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wNCAwOTowODozMiArMDEwMA==
  content: ! '<p>Boyd:  Oh. Wow.  I think I need to name all my children after Solaris
    developers.  I think I might have mentioned dtrace rocking a bit before, but that''s
    just ... wow.  I''m speechless.</p>'
---
> This is the sixth in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

Don't ever use alert boxes for javascript debugging. And certainly *never*
leave them in your production application! There's a unit testing framework
now available for Javascript which is bundled with the script.aculo.us
library. It looks and behaves a lot like every other xUnit. You create a test
suite by writing an HTML page with the appropriate JS in it to run the tests,
and a div with the id of 'testlog' which will show the results.

Add in the `javascript_test` plugin and you get the goodness of being able to
run `rake test:javascripts` from your Rails project. It will test on the
available browsers on your platform (including IE, Firefox, Safari &
Konqueror).

There isn't a cross-platform way of simulating DOM events, so automated
functional (behavioural?) testing is near impossible. There was a way to do it
in old versions of Firefox (or was it Mozilla?) but it was considered a
security issue and removed.

There are a number of tools available for JS debugging:

* Venkman, a plugin for Firefox.  It also does profiling.

* The latest nightly builds of Safari have the 'web inspector'.

* Microsoft Script Debugger is useful for tracking down IE issues, and it's
  even free.

One question from an audience member brought up the prospect of using vino
(apparently a command line JS client) for automated testing. Thomas seemed to
think this was a great idea and is going to look into it further.
