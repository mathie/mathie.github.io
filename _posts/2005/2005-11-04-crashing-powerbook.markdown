---
layout: post
title: Crashing Powerbook
date: 2005-11-04 12:27:50 +00:00
categories:
- Geekery
---
OK, this is an entirely new 'feature' for me: my laptop has crashed twice this morning. :-(  Well, when I say 'crashed', the mouse cursor still moves OK, but nothing responds.  I can still ssh into the laptop from another host, and it appears to be working OK from that POV.  I tried killing the foremost task from the command line (first using <code>kill</code>, then <code>kill -9</code>) but all that resulted in was having zombie processes lying around, and they didn't disappear from the desktop.  Looks like it's the WindowServer process that's failing to respond to events?  Bother.

This has only started happening since I upgraded to 10.4.3 -- I am suspecting a correlation.  There's nothing in the logs to indicate a cause.  So it's all just handwaving and saying "it disnae work" to me. :-/
