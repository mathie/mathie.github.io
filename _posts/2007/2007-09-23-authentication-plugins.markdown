---
layout: post
title: Authentication plugins
date: 2007-09-23 11:03:32 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 953
  author: Dana
  author_email: dana.janssen@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wOS0yMyAxNzozNzoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOS0yMyAxNjozNzoyMiArMDEwMA==
  content: <p>Wouldn't it make more Railsy for :any_action and :every_action to be
    represented by :all? I'll look out for this when 2.0 is released :)</p>
- id: 954
  author: Kevin Teague
  author_email: kevin@bud.ca
  author_url: http://www.bud.ca
  date: !binary |-
    MjAwNy0wOS0yMyAxODo1OToxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOS0yMyAxNzo1OToxOSArMDEwMA==
  content: ! '<p>Certainly looks more readable and understandable. But I suspect it
    would be possible to go one farther by just declaring roles required for actions.
    Anonymous users are granted the :public role, and logged in users are granted
    the :authenicated role, then you could just write things such as:</p>


    <p>require :public, :index, :show</p>


    <p>require :public, :any_action</p>


    <p>require :authenticated, :every_action</p>'
- id: 955
  author: Yitzhak Bar Geva
  author_email: yitzhakbg@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNi0yOSAxNTo1MzoxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNi0yOSAxNDo1MzoxMiArMDEwMA==
  content: ! '<p>Any news on this plugin? Would like to hear more and if there has
    been any progress.

    Thanks</p>'
---
I've been a happy user of `acts_as_authenticated`, and its lazy cousin `restful_authentication` for, well, it must be years now.  But lately it hasn't quite satisfied me.  (Which is a good reason auth shouldn't go into core, BTW: there's more than one way to do it and it's not a one-size-fits-all situation.)

Anyway, so I've basically written my own plugin to do authentication.  It's not ready for public consumption yet.  Apart from anything else, it depends not only on `acts_as_state_machine` but the patches I've got kicking around to make its behaviour more consistent.  It also requires edge Rails.  But I wanted to show off a wee preview, which I think sums how it wins over its predecessor.

In a controller, which looks clearer?

    before_filter :authentication_required, :except => [:index, :show]

Or?

    login_not_required_for :index, :show

It's a simple change, but it clearly expresses the intent of what I'm trying to do.  I also do roles in my own peculiar manner within the application.  So, again in a controller, we get to express:

    invite_manager_role_required_for :new, :create, :edit, :update, :destroy

where we had defined:

    Rubaidh::Authentication.roles += [:invite_manager, :moderator]

somewhere in `config/environment.rb`.  It defaults to containing 'administrator' IIRC.

It's horses for courses, I guess, but I just prefer that kind of expressiveness.  It feels more like I'm telling Rails what I want to do, rather than how to do it.

Oh, and you can also do:

    login_not_required_for :any_action

for public portions of your site, and:

    login_required_for :every_action

for the private bits.  That's starting to feel like I've been influenced by rspec -- where to the underscores, spaces and colons go in that sentence? -- but it'll do for now.

I'm planning to tidy it up for public consumption in the Rails 2.0 time frame, since it relies on Edge just now.  You can always find it if you know where to look though. :-)
