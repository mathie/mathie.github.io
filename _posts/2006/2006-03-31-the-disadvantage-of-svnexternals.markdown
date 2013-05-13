---
layout: post
status: publish
published: true
title: The disadvantage of `svn:externals`
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 251
wordpress_url: http://woss.name/2006/03/31/the-disadvantage-of-svnexternals/
date: 2006-03-31 10:26:20.000000000 +01:00
categories:
- Geekery
- Work
tags: []
comments:
- id: 352
  author: Matt Palmer
  author_email: mpalmer@hezmatt.org
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0wMSAyMTowMTowMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0wMSAyMDowMTowMSArMDEwMA==
  content: ! '<p>You''re crying out for distributed revision control -- you might
    just not know it yet.  (grin)  You could then trivially keep your own repositories,
    and choose when to sync with the trunk (retaining all of the metadata, which you
    don''t get by moving pure patches around).  svk will probably handle most of your
    needs.<&#47;p>


    <ul>

    <li>Matt<&#47;li>

    <&#47;ul>'
- id: 353
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNC0wMiAxMzoyODo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0wMiAxMjoyODo1NiArMDEwMA==
  content: ! '<p>Matt: Yeah, good point.  Is Bitkeeper still a rude word ''round these
    parts? :)  I''ll have a closer look at svk -- thanks for the tip.<&#47;p>'
- id: 354
  author: Mike H
  author_email: GFunk913@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMi0wMiAwOTo0MzoyMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wMiAwODo0MzoyMyArMDAwMA==
  content: ! '<p>Checkout Piston<&#47;p>


    <p>http:&#47;&#47;weblog.techno-weenie.net&#47;2006&#47;9&#47;18&#47;keeping-rails-plugins-up-to-date<&#47;p>'
- id: 355
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wMi0wMiAwOTo1MDo1NyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wMiAwODo1MDo1NyArMDAwMA==
  content: ! '<p>Mike: Yeah, I''ve been using piston for my last couple of projects
    and it''s fantastic.  Even better, it allows you to locally modify the plugins
    and keep track of those changes, which is handy for dealing with pending bugfixes.<&#47;p>'
- id: 356
  author: piston
  author_email: piston@blah.com
  author_url: http://piston
  date: !binary |-
    MjAwNy0wNC0wNSAxNzoxMzo0NSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNC0wNSAxNjoxMzo0NSArMDEwMA==
  content: <p>use piston.rubyforge.org<&#47;p>
---
The advantages of using `svn:externals' is that you can track the latest trunk of a particular piece of software and you can share plugins between products.

The disadvantage is when you're using `exception_notification` from http:&#47;&#47;dev.rubyonrails.org&#47; and the host appears to have died.  Then you can't deploy!

*sigh* I suppose I should be more careful and track third party dependencies in my own subversion repositories.  That way I can patch them (without waiting for patches to be incorporated upstream), make more definite decisions about when to incorporate a change (do I really want to be tracking `trunk&#47;` of J. Random Developer's plugin -- somebody who might even commit as broken, brain-dead code as I occasionally do?!?).
