---
layout: post
status: publish
published: true
title: What&#039;s in your irbrc?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-05-17 12:58:04.000000000 +01:00
categories:
- Geekery
tags: []
comments: []
---
I've been mucking around a bit this morning with my `~/.irbrc`, prompted by [why's](http://redhanded.hobix.com/) post about [MethodFinder](http://www.nobugs.org/developer/ruby/method_finder.html) (very shiny!).  And now I'm wondering what everybody else has in their `~/.irbrc`.  What do I have?  Well:

* bits to configure IRB itself -- enabling saved history, auto-indent, readline and forcing the prompt mode to the default (so that `script/console` doesn't change it!).
* the MethodFinder function, along with [why's modifications](http://redhanded.hobix.com/inspect/stickItInYourIrbrcMethodfinder.html).
* integrate `ri`.
* in a similar vein to `ri`, `mate` which launches TextMate.
* A couple of extra wee functions, mostly for inspecting objects.

You can grab the complete file here: [`irbrc`](http://woss.name/dist/irbrc.rb).

So, what's in your `~/.irbrc`?
