---
layout: post
status: publish
published: true
title: Generating Google Sitemaps
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 243
wordpress_url: http://woss.name/2006/03/15/generating-google-sitemaps/
date: 2006-03-15 15:00:49.000000000 +00:00
categories:
- Geekery
- Work
tags: []
comments:
- id: 326
  author: Doug
  author_email: doug@lathi.net
  author_url: http://blog.lathi.net
  date: !binary |-
    MjAwNi0wMy0xNiAyMjowNjo1MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0xNiAyMTowNjo1MSArMDAwMA==
  content: <p>Is there a link to the code somewhere?  I'd like to see the complete
    solution you're using...<&#47;p>
- id: 327
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMy0xNyAwNzo0MTo0NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0xNyAwNjo0MTo0NCArMDAwMA==
  content: ! '<p>Doug: Not yet.  If I get some consulting work out of the way quickly
    today, I''m going to figure out how to package it up into a plugin this afternoon.  Otherwise
    it''ll be sometime over the weekend.<&#47;p>'
---
OK, I *think* I've just about got this code kicked into shape.  I can now automatically generate [Google Sitemaps](http:&#47;&#47;www.google.com&#47;webmasters&#47;sitemaps&#47;) for a Rails application.  It's pretty ugly, and only really works for the static portions of a web site (ie not the bits that take `:id` somewhere in the URL and render stuff from the database), but it's a start, and suits what I need for [Rubaidh Ltd](http:&#47;&#47;www.rubaidh.com&#47;).

I suspect there's a better way of doing it than forcing all the controllers to load, then looking through `ObjectSpace` to determine which are subclasses of `ApplicationController` and querying all of them for their known actions.  I suspect the real solution lies somewhere in querying `ActionController::Routing` to find out what routes are available.  That way, we might also be able to determine what are static components and what are dynamic components, then do smart things about looking through the database for dynamically generated content and determining what's changed when.

But it solves enough of the problem for now.  When I get a chance to revisit it (by which time `ActionController::Routing` might have some documentation?), I'm going to package it up as a plug-in.
