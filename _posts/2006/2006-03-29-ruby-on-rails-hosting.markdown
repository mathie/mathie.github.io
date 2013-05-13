---
layout: post
title: Ruby on Rails hosting
date: 2006-03-29 09:08:13 +01:00
categories:
- Geekery
---
This is going to be one of those days.  I wake up to hear my phone beeping insistently at me, telling me of `DOWN ESCALATION` reports for all of my Ruby on Rails web sites.  Oh, bother.  [DreamHost](http://www.dreamhost.com/r.cgi?wossname) appears to be playing silly buggers.  It looks a lot like they've partially upgraded to RoR 1.1, but for some reason, not installed all the correct dependencies.  And as to why one of my sites that's already tied to 1.1 is dying, I have no idea.  It was working fine yesterday!

And to top everything off, I have a hangover.  Argh!

So, who do you recommend for Ruby on Rails hosting?  I've currently got 3 stable, production applications that I need not to crash.  And I've got another 2 in active development.  I'm not particularly fussed about any of the other aspects of hosting (email, DNS, subversion, etc) since DH does a good enough job of that for me.  I just need a stable host for deploying my applications where performance is good enough, there's the prospect of scaling as necessary, and it's reliable.  So, who would you recommend?

**update** Yes, freezing the rails version has solved the problem for most of the sites.  Though to play nicely with [capistrano](http://manuals.rubyonrails.com/read/book/17), I do it by setting `svn:externals` on `vendor/` to `rails http://dev.rubyonrails.org/svn/rails/tags/rel_1-1-0` instead of running `rake freeze_gems`. And for the one that was already tied to 1.1, the customer had coincidentally triggered a bug in my code, so that was nothing to do with anything else.  Now if only I could get typo to start working again, I'd be sorted.
