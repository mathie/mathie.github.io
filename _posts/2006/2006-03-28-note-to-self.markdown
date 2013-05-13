---
layout: post
title: Note to self
date: 2006-03-28 17:31:44 +01:00
categories:
- Geekery
- Work
comments:
- id: 329
  author: Forrest
  author_email: forrest.robertson@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0yOCAyMjo0Nzo0OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOCAyMTo0Nzo0OSArMDEwMA==
  content: <p>Wouldn't it be sweet if rails would include a reserved word list?  Even
    sweeter if it used that word list when running script/generate so that you couldn't
    name things great names that match your problem domain but can't be used?</p>
- id: 330
  author: Jamie Hill
  author_email: jamie@thelucid.com
  author_url: http://www.thelucid.com
  date: !binary |-
    MjAwNi0wMy0yOSAwMDozNTozMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOCAyMzozNTozMCArMDEwMA==
  content: <p>Weird, I came across exactly the same problem last week, was fine until
    I went to call params[:action], took at least an hour to figure out what was wrong.
    Should have twigged sooner realy. I agree with Forrest, some kind of safeguard
    for this would be good.</p>
---
Note to self: calling your shiny new model 'action' in Rails, no matter how well it maps to the problem domain, isn't really that great an idea.  The word might even sound familiar, eh?  You're only really going to notice the problem when it comes to form submission though (or possibly other interaction with the controller).
