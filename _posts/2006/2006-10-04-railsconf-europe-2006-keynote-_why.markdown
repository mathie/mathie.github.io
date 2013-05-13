---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: Keynote - _why'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-10-04 10:48:52.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
comments:
- id: 606
  author: James McCarthy
  author_email: james2mccarthy@gmail.com
  author_url: http://fluct.isono.us
  date: !binary |-
    MjAwNi0xMC0xMiAxNDowNDowMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMiAxMzowNDowMCArMDEwMA==
  content: <p>This one I truely like too... and the use of *splat was something that
    had passed me by until now. It is really nice to have some sessions that take
    the time to explore quite thoroughly how to make use of some features you may
    not have stumbled upon otherwise.</p>
---
> This is the ninth in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

What a strange, quirky, funny creature. He's the spitting image of Jack Black,
highly entertaining and obviously a gifted programmer. He showed us some neat
tricks with Ruby, like creative use of the splat (`*`) operator. One
particularly nice one was for doing regexps:

    m, *sub = *str.match /regexp/
    if m
      ## sub contains all of your matches
    end

I like that.

He also talked about his sandbox implementation, and how it can be used to run
multiple rails applications inside a single mongrel instance. I got to
thinking that this might be useful for merging third-party apps together into
a single cohesive web site. The most exciting thing? It sounds like sandbox
will be in the next Ruby 1.8.x release!
