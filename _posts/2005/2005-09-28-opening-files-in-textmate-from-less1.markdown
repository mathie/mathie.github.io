---
layout: post
title: Opening files in TextMate from less(1)
date: 2005-09-28 17:20:48 +01:00
categories:
- Geekery
comments:
- id: 123
  author: Sune Foldager
  author_email: cryo@diku.dk
  author_url: ''
  date: !binary |-
    MjAwNS0wOS0yOCAyMToxNzoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0yOCAyMDoxNzoyNiArMDEwMA==
  content: ! "Neat... adding to .bash_profile is normally the â€œbestâ€\x9D for ENV
    stuff, but that's really a minor point :-p."
- id: 124
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0wOS0yOSAwOTo1MDoxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0yOSAwODo1MDoxNSArMDEwMA==
  content: ! 'Sune: I always forget which is which ... my ~/.bash_profile and ~/.bashrc
    are both symlinks to ~/usr/etc/profile, which looks at $- to see if it''s an interactive
    shell before deciding exactly what to do.  See http://home.woss.name/file/homedir/trunk/usr/etc/profile
    and http://home.woss.name/browser/homedir/trunk/usr/etc/profile.d/ for the gruesome
    details.  Actually that could do with some reworking to speed it up...'
- id: 125
  author: Allan Odgaard
  author_email: allan@macromates.com
  author_url: http://macromates.com/
  date: !binary |-
    MjAwNS0xMC0xMSAxMjo1NTo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0xMSAxMTo1NTo1MSArMDEwMA==
  content: ! 'Nice â€” I''m adding this to the manual using the ''mate'' shell command:


    export LESSEDIT=''mate -l %lm %f'''
---
A quick <a href="http://macromates.com/">TextMate</a> trick, inspired from reading <a href="http://macromates.com/blog/archives/2005/09/28/html-output-for-commands/">HTML output for commands</a> (in particular the section on hyperlinking back to TextMate), I came up with the following:

[code]export LESSEDIT='open txmt\://open\?url=file\:///`pwd`/%f?lm\\&line=%lm.'[/code]

Add that to your <code>~/.bashrc</code> (or whatever) and, when you view a file in <code>less(1)</code>, then hit <code>v</code> to edit the file, it will bring it up in TextMate <em>at approximately the right line</em>, just as it used to do when you had <code>$VISUAL</code> set to <code>vim</code>.  It doesn't get the line exactly right -- it picks the middle of the screen you're currently looking at, but at least it gets nearer the context you've just decided you want to edit.
