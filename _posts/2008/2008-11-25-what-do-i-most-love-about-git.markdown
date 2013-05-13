---
layout: post
status: publish
published: true
title: What do I most love about git?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 494
wordpress_url: http://woss.name/?p=494
date: 2008-11-25 16:53:00.000000000 +00:00
categories:
- Geekery
- Ruby and Rails
- Software Configuration Management
- Work
tags: []
comments: []
---
Scott Chacon just asked on Twitter:

> poll: gitsters - what do you love most about git and why it over other scm&#47;dscms?
>
> &mdash; chacon

I'm only going to answer the first part, really, as I haven't really evaluated any other distributed SCM since Bitkeeper in 2002&#47;3.

So, what do I love most about git?  Well, it's the branching, but maybe not in quite the same way as everybody else.  My brain can be somewhat easily distracted (I have been compared to an over-caffeinated butterfly in the past).  In addition to that, I have clients who's number one OMG super-critical the-world-is-going-to-end bug fixes and feature requests can change on a daily basis.

So I have multiple lines of development running at once.  On my own.  In my own development tree on my laptop.  I can switch from one line of development to another with a single command.  I can combine features from one line of development into another.  When I've finished one of the things I started, I can merge it back in.  And I can rebase all my other lines of development to coincide with the changes.

Since I've got a great test suite, I can be sure that all of this branching and merging (which, in my case anyway, shows up quite a few conflicts) isn't breaking code, either.

Anyway, that's what I most love about git: not just short-lived branches, but an easy way to have multiple lines of development for arbitrary lengths of time and not have any of those lines rot over time.

Now, if only I had git stashed what I was doing before I context switched to write this post, I could apply it again and remember what I was supposed to be doing!
