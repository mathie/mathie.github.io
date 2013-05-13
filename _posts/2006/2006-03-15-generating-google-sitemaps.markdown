---
layout: post
title: Generating Google Sitemaps
date: 2006-03-15 15:00:49 +00:00
categories:
- Geekery
- Work
---
OK, I *think* I've just about got this code kicked into shape.  I can now automatically generate [Google Sitemaps](http://www.google.com/webmasters/sitemaps/) for a Rails application.  It's pretty ugly, and only really works for the static portions of a web site (ie not the bits that take `:id` somewhere in the URL and render stuff from the database), but it's a start, and suits what I need for [Rubaidh Ltd](http://www.rubaidh.com/).

I suspect there's a better way of doing it than forcing all the controllers to load, then looking through `ObjectSpace` to determine which are subclasses of `ApplicationController` and querying all of them for their known actions.  I suspect the real solution lies somewhere in querying `ActionController::Routing` to find out what routes are available.  That way, we might also be able to determine what are static components and what are dynamic components, then do smart things about looking through the database for dynamically generated content and determining what's changed when.

But it solves enough of the problem for now.  When I get a chance to revisit it (by which time `ActionController::Routing` might have some documentation?), I'm going to package it up as a plug-in.
