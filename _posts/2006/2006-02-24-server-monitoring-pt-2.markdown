---
layout: post
status: publish
published: true
title: Server monitoring, pt. 2
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 236
wordpress_url: http://woss.name/2006/02/24/server-monitoring-pt-2/
date: 2006-02-24 16:35:10.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 314
  author: Kisin
  author_email: kisin@livejournal.com
  author_url: http://kisin.livejournal.com
  date: !binary |-
    MjAwNi0wMi0yNCAxODoxMDowMiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yNCAxNzoxMDowMiArMDAwMA==
  content: <p>The port monitoring is a lot cheaper, they do work very well. On the
    other hand if it's works money just spend it ;-)</p>
- id: 315
  author: Tim
  author_email: web@pentaprism.org
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0yNCAyMDo1NzoyOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yNCAxOTo1NzoyOSArMDAwMA==
  content: <p>How about getting the servers to send you a status email every 15 minutes
    with various server stats.  A simple script that passes on anything urgent to
    an Orange / Vodafone email address or emails if an email is missing could work
    quite efficiently.  You would need a 3g or gprs phone, but I know you can set
    Orange to sms you on new messages if you prefer to save battery life and not maintain
    a perpetual network connection.</p>
- id: 316
  author: Luke Redpath
  author_email: contact@lukeredpath.co.uk
  author_url: http://www.lukeredpath.co.uk
  date: !binary |-
    MjAwNi0wMi0yNSAwMDo0NjozOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yNCAyMzo0NjozOCArMDAwMA==
  content: <p>Keep an eye on an open source RubyOnRails project of mine called SiteSeer.
    Its just coming up to the 0.1 release but by the time 1.0 rolls around it should
    be able to do most of what Server Monitoring does. You can install it on your
    own machine or server and the only costs involved are credits for SMS services.</p>
- id: 317
  author: Luke Redpath
  author_email: contact@lukeredpath.co.uk
  author_url: http://www.lukeredpath.co.uk
  date: !binary |-
    MjAwNi0wMi0yNSAwMDo0Njo1MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yNCAyMzo0Njo1MyArMDAwMA==
  content: ! '<p>Sorry, link would be useful</p>


    <p>http://rubyforge.org/projects/siteseer/</p>'
- id: 318
  author: Kisin
  author_email: kisin@livejournal.com
  author_url: http://kisin.livejournal.com/
  date: !binary |-
    MjAwNi0wMi0yNSAxMTowMzowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yNSAxMDowMzowNSArMDAwMA==
  content: <p>If you can get an email address that sends an SMS for a mobile (or a
    pager) then it'll not cost you any money.</p>
- id: 319
  author: Andy
  author_email: andymccown@mac.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0yNyAxNzowNToyMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yNyAxNjowNToyMyArMDAwMA==
  content: <p>Hm, this may be an opportunity to set up an informal network of people
    who monitor each other's sites - you scratch my back, I'll scratch yours. That
    way, both people get the benefit of having monitoring running from somewhere else,
    without having to getting another account somewhere.</p>
---
Well, I've created myself a trial account with [Server Monitoring](http://www.server-monitoring.co.uk) and it seems to be working pretty well.  At least it just SMS'd me to tell me that a couple of my sites were unavailable -- sure enough, when I eventually managed to log into the host they are on (`napoleon.dreamhost.com`), yep, it had a load average of 135+.  And none of my sites were responding.  On the other hand, whoever caused that owes me 60p worth of text messages!

I've toned down the alerts slightly.  Now it will email me as soon as there's something awry, but it will only SMS me if things have been screwy for 15 minutes.  Which, if I'm not at the computer, already is not much in the way of extra lag time, really.  And it'll only SMS me for the **important** customer sites. :)

I'm still after another, cheaper, solution, since this will cost em &pound;50 per web host I want to monitor.  I guess it's possible that it will be cheaper to get a virtual host of some variety and run `mon` or `nagios` on it.  Still, in my experience, these systems have too many false positives or require too much time to maintain, so I'd rather get somebody else to do it well...
