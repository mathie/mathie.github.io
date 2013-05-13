---
layout: post
status: publish
published: true
title: What&#039;s in your irbrc?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 272
wordpress_url: http://woss.name/2006/05/17/whats-in-your-irbrc/
date: 2006-05-17 12:58:04.000000000 +01:00
categories:
- Geekery
tags: []
comments: []
---
I've been mucking around a bit this morning with my `~&#47;.irbrc`, prompted by [why's](http:&#47;&#47;redhanded.hobix.com&#47;) post about [MethodFinder](http:&#47;&#47;www.nobugs.org&#47;developer&#47;ruby&#47;method_finder.html) (very shiny!).  And now I'm wondering what everybody else has in their `~&#47;.irbrc`.  What do I have?  Well:

* bits to configure IRB itself -- enabling saved history, auto-indent, readline and forcing the prompt mode to the default (so that `script&#47;console` doesn't change it!).
* the MethodFinder function, along with [why's modifications](http:&#47;&#47;redhanded.hobix.com&#47;inspect&#47;stickItInYourIrbrcMethodfinder.html).
* integrate `ri`.
* in a similar vein to `ri`, `mate` which launches TextMate.
* A couple of extra wee functions, mostly for inspecting objects.

You can grab the complete file here: [`irbrc`](http:&#47;&#47;woss.name&#47;dist&#47;irbrc.rb).

So, what's in your `~&#47;.irbrc`?
