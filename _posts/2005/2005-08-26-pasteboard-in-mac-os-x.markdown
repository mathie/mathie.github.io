---
layout: post
status: publish
published: true
title: Pasteboard in Mac OS X
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-08-26 12:13:23.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 82
  author: Gavin Kistner
  author_email: gavin@refinery.com
  author_url: http://phrogz.net/
  date: !binary |-
    MjAwNS0xMC0xMSAxNDowNzoyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0xMSAxMzowNzoyOSArMDEwMA==
  content: ! 'Ahhh! So *that''s* why, when I entered a find string in TextMate, and
    then opened up the file in BBEdit and opened its find dialog...the string was
    already there.


    It really creeped me out when it happened. Way too prescient. Now I know why :)'
---
I've just discovered a couple of nice things about the Pasteboard (or clipboard as it's called in every other UI!) in Mac OS X.

You can manipulate the Pasteboard from the command line interface with <code>pbcopy</code> (which takes from <code>stdin</code> and copies it to the clipboard) and <code>pbpaste</code> (which dumps the content of the clipboard to <code>stdout</code>).  This means that, for example, you can dump the output of a shell script straight to the clipboard, rather than letting it flow to <code>stdout</code>, then selecting and copying the output from the terminal (something I do quite often, particularly when I'm trying to write documentation or tutorials).

The other thing I learned (both from the <code>pbcopy(1)</code> manual page and from a post on the <a href="http://macromates.com/">TextMate</a> users mailing list) was that there are multiple Pasteboards in Mac OS X.  According to the man page, they are named 'general', 'ruler', 'find' and 'font'.  General is where stuff goes by default.  I've don't know what 'ruler' and 'font' do, but I can guess they're for copying and pasting particular artefacts (so you can copy'n'paste text formatting rather than the text itself in the case of 'font'?).  Find is an interesting one.  Select a piece of text in a Cocoa app.  Hit &#x2318;-E to copy this text to the 'find' pasteboard.  Now go to the 'find' window.  Note that the text you pushed to the 'find' pasteboard is now in the 'Find' box, automagically.  And it's all done without disturbing what's currently on your main pasteboard.
