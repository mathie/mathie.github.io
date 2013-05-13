---
layout: post
status: publish
published: true
title: Ruby on Rails hosting
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 248
wordpress_url: http://woss.name/2006/03/29/ruby-on-rails-hosting/
date: 2006-03-29 09:08:13.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 331
  author: Paul Ingles
  author_email: paul@oobaloo.co.uk
  author_url: http://www.oobaloo.co.uk
  date: !binary |-
    MjAwNi0wMy0yOSAwOTo1ODozNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAwODo1ODozNSArMDEwMA==
  content: ! '<p>I went with Rimuhosting for my website, which provides a full-blown
    VPS so I get my own virtual server, away from anyone else''s meddling. This also
    means you''re in control with regards to upgrading bits, changing the version
    of Ruby etc.<&#47;p>


    <p>The only issue is that it does mean you get your hands dirtier with setting
    things up, but I found a good guide that covered it all so that was pretty easy-going.<&#47;p>


    <p>As for scalability, it''s pretty easy to extend the VPS up with a plan that
    includes a greater memory allocation etc., if you wanted to you could even setup
    an additional VPS on a different server within the same facility for some load-balancing&#47;redundancy.<&#47;p>'
- id: 332
  author: Annabel
  author_email: annabel@rubaidh.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0yOSAxMDozMjo1MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAwOTozMjo1MiArMDEwMA==
  content: <p>ahh, i wondered what that constant beeping was while i was trying to
    sleep this morning!<&#47;p>
- id: 333
  author: aurelian
  author_email: oancea@gmail.com
  author_url: http://locknet.ro
  date: !binary |-
    MjAwNi0wMy0yOSAxMjoyNTo0NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxMToyNTo0NCArMDEwMA==
  content: ! '<p>At one point I''ve read some docs explaining a rake task that will
    freeze your applications so they will not depend on your host upgrade.

    Can find the link right now, but you can try:

    rake freeze_gems  # Lock this application to the current gems (by unpacking them
    into vendor&#47;rails)<&#47;p>'
- id: 334
  author: Luke Redpath
  author_email: contact@lukeredpath.co.uk
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0yOSAxMjozNDo0MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxMTozNDo0MCArMDEwMA==
  content: <p>To date, my experience with shared hosts hasn't been a good one to be
    honest. It would seem that dedicated hosting is the right way to go for now for
    Rails hosting although I have one more shared host to try out and that is Site5.
    Everything seems good so far and their engineering team are fully behind Rails.
    I've tried Textdrive who were good in many ways but far to unreliable in my opinion
    for client sites. I've tried a few others that I've had problems with including
    Dreamhost and I've had various problems.<&#47;p>
- id: 335
  author: Anton Kovalyov
  author_email: anton@kovalyov.net
  author_url: http://anton.kovalyov.net
  date: !binary |-
    MjAwNi0wMy0yOSAxMjo0MTowMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxMTo0MTowMSArMDEwMA==
  content: <p>Freeze your rails app.<&#47;p>
- id: 336
  author: mikkel
  author_email: mikkel@helenius.dk
  author_url: http://www.strongside.dk
  date: !binary |-
    MjAwNi0wMy0yOSAxNDozMTo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxMzozMTo1NyArMDEwMA==
  content: <p>ALWAYS freeze your app when running on a shared server...or...just freeze
    it always...<&#47;p>
- id: 337
  author: Rob Sanheim
  author_email: rsanheim@gmail.com
  author_url: http://www.robsanheim.com
  date: !binary |-
    MjAwNi0wMy0yOSAxNDo1NDo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxMzo1NDo1NyArMDEwMA==
  content: <p>Another vote for a VPS like rimuhosting.  Shared hosting would scare
    me far too much for any sort of client-facing site.<&#47;p>
- id: 338
  author: Jon
  author_email: jonhanson@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0yOSAxODoyMTo0NSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxNzoyMTo0NSArMDEwMA==
  content: <p>Could you walk us newbie dreamhost rails users through freezing it a
    bit more clearly. Thanks!<&#47;p>
- id: 339
  author: topfunky
  author_email: boss@topfunky.com
  author_url: http://nubyonrails.com
  date: !binary |-
    MjAwNi0wMy0yOSAxOToyMzo1NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxODoyMzo1NCArMDEwMA==
  content: ! '<p>Shared hosting is a mixed bag. I''m considering a VPS, but have also
    gotten a little help with a monitoring tool that at least emails me when things
    go wrong (like today when Dreamhost upgraded to Rails 1.1 in the middle of the
    night).<&#47;p>


    <p>http:&#47;&#47;nubyonrails.com&#47;articles&#47;2006&#47;03&#47;29&#47;surviving-rails-1-1-with-server-monitoring<&#47;p>'
- id: 340
  author: Gizmoojo! &raquo; Blog Archive &raquo; Downtime
  author_email: ''
  author_url: https://gizmoojo.wordpress.com/2006/03/30/downtime/
  date: !binary |-
    MjAwNi0wMy0yOSAyMDoyMDowOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yOSAxOToyMDowOSArMDEwMA==
  content: ! '<p>[...] *Update to this: It appears that Dreamhost has decided to upgrade
    to Rails 1.1 and is causing outrage on all the rails site hosted as I had predicted.
    Why.. Why.. Why&#8230; Dreamhost&#8230;..     Posted by gizmoojo Filed in Ruby
    on Rails, gizmoojo, dreamhost [...]<&#47;p>'
- id: 341
  author: Peter
  author_email: peter@sproutit.com
  author_url: http://www.sproutit.com/bigact
  date: !binary |-
    MjAwNi0wMy0zMCAwMjowMzozOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0zMCAwMTowMzozOCArMDEwMA==
  content: ! '<p>We had a heck of a time keeping our site up while in development.  We
    tried several of the bigger names in ruby hosting but either they had great support
    but serious down time or expected you to play sys admin for everything.<&#47;p>


    <p>We also thought it was silly to shell out for a dedicated box during development
    so after searching the world over (literally) we found "Avlux":http:&#47;&#47;avlux.net&#47;.  Andrew
    is great and was able to help us through all the pitfalls of living on the edge
    with RoR.   I can highly recommend Avlux for anything from a small site to helping
    put your app into production.<&#47;p>


    <p>Hope that helps!<&#47;p>'
- id: 342
  author: Peter
  author_email: peter@sproutit.com
  author_url: http://www.sproutit.com/bigact
  date: !binary |-
    MjAwNi0wMy0zMCAyMjoyMTozMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0zMCAyMToyMTozMSArMDEwMA==
  content: <p>Sorry I forgot I wasn't in our blog.  This should be the right format
    for links href="http:&#47;&#47;avlux.net">AVLUX<&#47;p>
- id: 343
  author: steve
  author_email: ste@mailhost.sst
  author_url: http://www.BlackSun.ca/lite.html
  date: !binary |-
    MjAwNi0wNi0wNiAxOToyMzoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0wNiAxODoyMzoxMSArMDEwMA==
  content: <p>BlackSun.ca Offers Ruby on Rails web hosting on any of their plans,
    starting at $10 cdn per month ($7 usd).  All of the plans are Feature - Rich...
    with a lot of free stuff included!<&#47;p>
- id: 344
  author: Maykel Rodriguez
  author_email: mayklerr@marori.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0xOSAxMTowMjozOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0xOSAxMDowMjozOCArMDAwMA==
  content: <p>Shared hosting can be a good solution for those not wanting to administer
    their own linux servers... I can recommend speedyrails.com, performance and support
    are very good.<&#47;p>
- id: 345
  author: Alojamento Sites
  author_email: alojamentowebsite@hotmail.com
  author_url: http://www.alojamentowebsite.com
  date: !binary |-
    MjAwNy0wMi0yMCAxNzoxNjoxNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0yMCAxNjoxNjoxNiArMDAwMA==
  content: <p>Here is another vote for VPS hosting, Ill be do the same thing with
    my websites soon.<&#47;p>
---
This is going to be one of those days.  I wake up to hear my phone beeping insistently at me, telling me of `DOWN ESCALATION` reports for all of my Ruby on Rails web sites.  Oh, bother.  [DreamHost](http:&#47;&#47;www.dreamhost.com&#47;r.cgi?wossname) appears to be playing silly buggers.  It looks a lot like they've partially upgraded to RoR 1.1, but for some reason, not installed all the correct dependencies.  And as to why one of my sites that's already tied to 1.1 is dying, I have no idea.  It was working fine yesterday!

And to top everything off, I have a hangover.  Argh!

So, who do you recommend for Ruby on Rails hosting?  I've currently got 3 stable, production applications that I need not to crash.  And I've got another 2 in active development.  I'm not particularly fussed about any of the other aspects of hosting (email, DNS, subversion, etc) since DH does a good enough job of that for me.  I just need a stable host for deploying my applications where performance is good enough, there's the prospect of scaling as necessary, and it's reliable.  So, who would you recommend?

**update** Yes, freezing the rails version has solved the problem for most of the sites.  Though to play nicely with [capistrano](http:&#47;&#47;manuals.rubyonrails.com&#47;read&#47;book&#47;17), I do it by setting `svn:externals` on `vendor&#47;` to `rails http:&#47;&#47;dev.rubyonrails.org&#47;svn&#47;rails&#47;tags&#47;rel_1-1-0` instead of running `rake freeze_gems`. And for the one that was already tied to 1.1, the customer had coincidentally triggered a bug in my code, so that was nothing to do with anything else.  Now if only I could get typo to start working again, I'd be sorted.
