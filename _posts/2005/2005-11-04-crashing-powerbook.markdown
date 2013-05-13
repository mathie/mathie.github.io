---
layout: post
status: publish
published: true
title: Crashing Powerbook
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-11-04 12:27:50.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 192
  author: John
  author_email: romkey@apocalypse.org
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0wNCAyMDo1NDozMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wNCAxOTo1NDozMCArMDAwMA==
  content: ! 'There''s some kind of bad interaction in some machines with more than
    1GB of RAM and a wireless card. You may notice that your wireless connection is
    dropping out when this happens too. Apple just released an Airport update which
    has fixed the problem for many people (but apparently not all).


    Check it out at http://www.apple.com/support/downloads/airportupdate2005001.html


    There are a lot of reports of this problem on the Apple support forums. It seems
    that some people have no problems and then suddenly start seeing this issue, probably
    because their memory usage patterns have changed.


    Good luck, I hope this patch solves the problem. It fixed it for me.'
- id: 193
  author: James Lyndsay
  author_email: jdl@workroom-productions.com
  author_url: http://www.workroom-productions.com
  date: !binary |-
    MjAwNS0xMS0wOCAxODowMjo0OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wOCAxNzowMjo0OSArMDAwMA==
  content: Similar problem on mine with 10.4.2 - mouse moves but can't touch much.
    Can still use key commands. Typically have to shut down laptop (sans mouse) to
    regain full control. Happens most often when propellor-tabbing through apps and
    using dock at same time.
---
OK, this is an entirely new 'feature' for me: my laptop has crashed twice this morning. :-(  Well, when I say 'crashed', the mouse cursor still moves OK, but nothing responds.  I can still ssh into the laptop from another host, and it appears to be working OK from that POV.  I tried killing the foremost task from the command line (first using <code>kill</code>, then <code>kill -9</code>) but all that resulted in was having zombie processes lying around, and they didn't disappear from the desktop.  Looks like it's the WindowServer process that's failing to respond to events?  Bother.

This has only started happening since I upgraded to 10.4.3 -- I am suspecting a correlation.  There's nothing in the logs to indicate a cause.  So it's all just handwaving and saying "it disnae work" to me. :-/
