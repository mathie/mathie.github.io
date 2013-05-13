---
layout: post
status: publish
published: true
title: Accidental Placing
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 456
wordpress_url: http://woss.name/2007/07/23/accidental-placing/
date: 2007-07-23 12:11:09.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 941
  author: Jade Dias
  author_email: kdias@telegraph.co.uk
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yNSAyMzo0ODo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNSAyMjo0ODo1MSArMDEwMA==
  content: <p>Great work!<&#47;p>
---
It's weird when you're reading through your RSS feeds and come across your own name in a screenshot.  Apparently I'm one of the top ten contributors to Rails this month: [Working with Rails July Hackfest](http:&#47;&#47;www.workingwithrails.com&#47;hackfest&#47;13-monthly-july-2-7) (currently at no. 7).  Not quite sure how I managed that, it's just been pure coincidence that I've been hacking on edge with a new project lately. :-)  So, what do you reckon I could do to get [#8830](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;8830), [#8831](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;8831), [#8832](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;8832), [#9051](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;9051) or [#9056](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;9056) accepted before the end of the month?

In other news, I learned something interesting this morning.  I was doing something that boiled down to:

    irb(main):001:0> a = Array.new(3, [])
    => [[], [], []]
    irb(main):002:0> a[0] << 3
    => [3]
    irb(main):003:0> a
    => [[3], [3], [3]]

and wondering what on earth was going on!  Turns out that when creating a new array in this way, it creates each new item in the array using a reference to what was passed in, rather than duplicating it.  So all three items in the new array are in fact references to the same array passed in.  This is actually well documented in the Pickaxe, but I just assumed different behaviour and got confused.  What I actually wanted to do was:

    irb(main):004:0> a = Array.new(3) { [] }
    => [[], [], []]
    irb(main):005:0> a[0] << 3
    => [3]
    irb(main):006:0> a
    => [[3], [], []]

which got me the desired behaviour.  Of course, all this was deep inside some other code (implementing `Enumerable#unzip` to provide the reverse of `zip`) so it took me a good while this morning to track down what was going on.

**Update** Add [#9085](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;9085) and [#9097](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;9097) to that list. :-)
