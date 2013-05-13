---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: Integrating Asterisk &amp; Rails'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 314
wordpress_url: http://woss.name/2006/09/30/railsconf-europe-2006-integrating-asterisk-rails/
date: 2006-09-30 16:41:45.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
comments: []
---
> This is the second in a series of articles of me writing up my notes from RailsConf Europe 2006.  They are all first drafts, probably technically inaccurate and slanderously misquoting people.  Let me know and I'll fix them.  You can follow this series of posts by looking at articles in the [RailsConf Europe](/index.php?s=RailsConf+Europe+2006) category.

I made a mistake in going to this one. I was thought (probably because
I hadn't read the abstract closely enough!) that this was going to be all
about creating DSLs with Asterisk as a concrete example. It wasn't, it was all
about Asterisk and VoIP. So I didn't take many notes.

However, the integration stuff was pretty neat. It's all about having a single
application with both a web user interface and a voice user interface. Voice
UI design is vastly different to web UI. They've integrated into controllers
with `respond_to` which allows different rendering for voice format responses.
There are `form_for` style helpers for creating a question and answer system
over the phone which will be able to record responses, or interpret DTMF
tones.

Apparently you can also bridge between the phone and the web so that the
application knows that two points of input (eg phone and web client at the
desk of a call centre weenie) are actually the same session.
