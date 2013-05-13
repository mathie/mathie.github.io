---
layout: post
title: ! 'New in Edge Rails: Kine!'
date: 2007-06-24 11:22:42 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
---
I've just done a `piston update` on a project I'm doing that's using edge Rails and was reviewing the changes.  Apart from the lovely documentation that ActiveResource appears to have been donated, there's another exciting change I spotted:

    irb(main):002:0> 'cow'.pluralize
    => "kine"

which is a change in behaviour from stable:

    irb(main):001:0> 'cow'.pluralize
    => "cows"

It turns out that 'kine' really is [an archaic plural of cow](http://www.thefreedictionary.com/kine).  So if you have an application modeling cattle, beware! :-)

**Update** Aha, it's all down to [#4929](http://dev.rubyonrails.org/ticket/4929) in Trac.
