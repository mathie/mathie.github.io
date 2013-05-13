---
layout: post
status: publish
published: true
title: Monitoring site availability
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-02-21 15:57:37.000000000 +00:00
categories:
- Geekery
- Python
tags: []
comments:
- id: 309
  author: Tim
  author_email: pleh@pleh.edu
  author_url: http://pig.sty.nu/wittering/
  date: !binary |-
    MjAwNi0wMi0yMSAxNzo1Mzo0NyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAxNjo1Mzo0NyArMDAwMA==
  content: ! '<p>Personally I use <em>mon</em> as you say - but with two sites monitoring
    an overlapping set of services, and also monitoring gateway routers immediately
    outside each other''s networks. This way I can distinguish the scenarios: both
    boxes alert about one service =&gt; the service is down; one box alerts about
    everything and the other about its router =&gt; network glitch.</p>'
- id: 310
  author: Kisin
  author_email: kisin@livejournal.com
  author_url: http://kisin.livejournal.com/
  date: !binary |-
    MjAwNi0wMi0yMSAyMjoyOTowOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAyMToyOTowOCArMDAwMA==
  content: ! '<p>We use http://www.server-monitoring.co.uk/ at work and they seem
    to do really well. Don''t think we''ve had any fals positives, they can get to
    a pager, email and SMS.</p>


    <p>They support a number of protocols, includeing HTTP, HTTPS and SMTP. I think
    I had it set up on projectcolo at one point, but no one wanted to pay the 12.50
    a year for PING monitoring. It costs more for HTTP, but I think that can do magic
    based on the HTTP responce code.</p>'
- id: 311
  author: Ezra
  author_email: ez@brainspl.at
  author_url: http://brainspl.at
  date: !binary |-
    MjAwNi0wMi0yMiAwMDoyMTo0OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAyMzoyMTo0OSArMDAwMA==
  content: ! "<p>Here is a simple ruby script I use with cron to check the availability
    of some of my sites. Cheers to the lazyweb:</p>\n\n<pre>\n#! /usr/local/bin/ruby\n#\n#
    simple script to monitor uris\n#\n# sample cron line\n#\n#   */15 * * * * /usr/local/bin/ruby
    /home/ez/mon/site_monitor.rb &gt; /dev/null 2&gt;&amp;1\n#\n\n  require \"net/http\"\n
    \ require \"net/smtp\"\n  require \"yaml/store\"\n  require \"socket\"\n#\n# array
    of urls to ping\n#\n  uris = %w(\n    www.yakimaherald.com\n    brainspl.at\n
    \ )\n#\n# array of people to notify if urls are down\n#\n  recipients = %w(\n
    \   ezra@yakimaherald.com\n  )\n#\n# message format string\n#\n  msg_fmt = %Q(\n
    \   URI: %s\n\n    TIME: %s\n\n    EXCEPTION: %s\\n%s\n  )\n#\n# user to send
    messages as\n#\n  user = \"ez\"\n#\n# host to send messages from\n#\n  host =
    ENV[\"HOSTNAME\"] || ENV[\"HOST\"] || Socket::gethostname\n#\n# maximum number
    of messages to send\n#\n  msg_max = 3\n#\n# db class to store codes/notifications\n#\n
    \ class DB\n    attr \"path\"\n    attr \"db\"\n    def initialize path = File::join(File::expand_path(\"~\"),
    \".uri.db\")\n      @path = path\n      @db = ::YAML::Store::new @path\n    end\n
    \   def reset uri\n      @db.transaction{ @db[uri] = {\"success\" =&gt; true,
    \"msgs\" =&gt; 0} }\n    end\n    def [] uri\n      @db.transaction{ @db[uri]
    } || reset(uri)\n    end\n    def []= uri, record\n      @db.transaction{ @db[uri]
    = record }\n    end\n  end\n#\n# umbrella error class\n#\n  class SiteDownError
    \ \"up\"\n      db.reset uri\n\n    rescue Exception =&gt; e\n      y uri =&gt;
    \"down\"\n      record = db[uri]\n\n      if record[\"msgs\"] </pre>"
- id: 312
  author: Stoyan Zhekov
  author_email: zhesto@gmail.com
  author_url: http://typo.onxen.info/
  date: !binary |-
    MjAwNi0wMi0yMiAwOToyNjoyNCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMiAwODoyNjoyNCArMDAwMA==
  content: ! '<p>Here [ http://wota.jp/ac/?date=20060210#p02 ] is the cute way to
    monitor your rails application:

    1. generate status_controller

    2. modify the code: [ http://rails.wota.jp/pubs/misc/status_controller.rb ]

    3. define your own checks (def MyCheck &lt; Check ... end)

    4. Add them to ''def checks [ ....] end''

    5. add http://your.site/status/rss to your favorite RSS reader (for example Firefox
    Live Bookmark), use RSS to email or something else to follow changes</p>'
- id: 313
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0wMi0yMiAxMzoxNTo0MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMiAxMjoxNTo0MSArMDAwMA==
  content: ! '<p>There are a number of cheapish providers of UML/XEN systems out there:
    if something like server-monitoring is too expensive (though for commercial use
    it''s probably OK, I''d guess) then using one of those to give you another machine
    might be a possibility.</p>'
---
I'm getting the hang of this lazyweb stuff. :-)

What do you use for monitoring the availability of web sites and systems?  I'd like to have some system which will notify me if any of my web sites (and possibly other key application services) disappear, preferably by email and SMS message to my mobile phone.

In the past I've used [Mon](http://www.kernel.org/software/mon/) and [Nagios](http://www.nagios.org/), but this time around I don't have the spare (ie not one of the machines I want monitored!) resources to set this up, and I'd rather 'outsource' the responsibility for setting up and maintaining the system.  (It's all about 'core' and 'context' -- I'd much rather be getting on with the 'core' work and let somebody else take care of the 'context'.)

So, what do you all use for monitoring your business-critical web applications?
