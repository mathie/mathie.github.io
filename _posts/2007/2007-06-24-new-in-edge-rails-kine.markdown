---
layout: post
status: publish
published: true
title: ! 'New in Edge Rails: Kine!'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 443
wordpress_url: http://woss.name/2007/06/24/new-in-edge-rails-kine/
date: 2007-06-24 11:22:42.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 891
  author: Jim James
  author_email: jim@jimjames.org
  author_url: http://p.latyp.us
  date: !binary |-
    MjAwNy0wNi0yNCAxNToyMjo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0yNCAxNDoyMjo0NyArMDEwMA==
  content: ! '<p>Obviously because someone on the core team is a fan of Car Talk.
    This was the subject of a recent stumper from Click and Clack: http://cartalk.com/content/puzzler/transcripts/200708/index.html</p>


    <p>Arf!</p>'
---
I've just done a `piston update` on a project I'm doing that's using edge Rails and was reviewing the changes.  Apart from the lovely documentation that ActiveResource appears to have been donated, there's another exciting change I spotted:

    irb(main):002:0> 'cow'.pluralize
    => "kine"

which is a change in behaviour from stable:

    irb(main):001:0> 'cow'.pluralize
    => "cows"

It turns out that 'kine' really is [an archaic plural of cow](http://www.thefreedictionary.com/kine).  So if you have an application modeling cattle, beware! :-)

**Update** Aha, it's all down to [#4929](http://dev.rubyonrails.org/ticket/4929) in Trac.
