---
layout: post
title: ! 'RailsConf Europe 2006: Keynote - _why'
date: 2006-10-04 10:48:52 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
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
