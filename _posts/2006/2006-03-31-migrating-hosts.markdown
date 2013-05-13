---
layout: post
status: publish
published: true
title: Migrating hosts
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 250
wordpress_url: http://woss.name/2006/03/31/migrating-hosts/
date: 2006-03-31 09:12:55.000000000 +01:00
categories:
- Geekery
- Work
tags: []
comments: []
---
Well, yesterday was fun.  After all the kind comments I received, I decided to go shopping for a VPS to host my applications.  And, from [Paul](http:&#47;&#47;www.oobaloo.co.uk&#47;)'s recommendation, decided to give [Rimuhosting](http:&#47;&#47;rimuhosting.com&#47;) a shot.  The host was set up within a couple of hours of my application, along with a personal, friendly email introducing me to the service.  (Good customer service!  +1!)

So I spent the full day re-familiarising myself with [Debian](http:&#47;&#47;www.debian.org&#47;) (well, [Ubuntu](http:&#47;&#47;www.ubuntu.com&#47;) really, but their nice and similar, only Ubuntu has a release schedule that better suits me!).  I wound up upgrading to [Dapper Drake](https:&#47;&#47;wiki.ubuntu.com&#47;DapperDrake), the current 'testing' release which is scheduled to be released in June.  It seems to work nicely, has MySQL 4.1 (which, IIRC from working with [MailManager](http:&#47;&#47;www.logicalware.org&#47;), has almost useful Unicode support) [Ruby 1.8.4](http:&#47;&#47;www.ruby-lang.org&#47;) and [lighttpd](http:&#47;&#47;www.lighttpd.net&#47;) already packaged.

I made the decision *not* to use dpkg as a source for any of the Ruby modules.  It provides me with the base Ruby installation, and everything else is provided by Rubygems.  That allows me to stay on the bleeding edge a bit better, if necessary, giving me finer control over which Ruby packages I use.  Everything else is provided by the base system.

My previous experience of lighttpd was it magically being used when I run `script&#47;server`, so I spent a while figuring out how to get that working, first of all having it spawn the fcgi processes directly, then moving on to using the Rails spinners.  (Note to self:  I still need to setup an init script to run `&#47;home&#47;vhosts&#47;*&#47;current&#47;script&#47;spin` so that things start up correctly after a reboot!)

But now I have my two 'production' applications running on the new host.  There was an unfortunate period of downtime while I switched the DNS across (though now I have control of the http daemon, that should never happen again, because I can fiddle in some proxying to the new host for the next scale-up).

All in all, I'm quite pleased with myself.  I managed to set up and deploy a Rails-based hosting service in less than a day, figuring large amounts of it from scratch.  This bodes well for any future deployments.  Next time I should document it step-by-step.  And after that, automate it.
