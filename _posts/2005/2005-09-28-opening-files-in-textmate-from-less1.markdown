---
layout: post
status: publish
published: true
title: Opening files in TextMate from less(1)
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 125
wordpress_url: http://woss.name/?p=125
date: 2005-09-28 17:20:48.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 123
  author: Sune Foldager
  author_email: cryo@diku.dk
  author_url: ''
  date: !binary |-
    MjAwNS0wOS0yOCAyMToxNzoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0yOCAyMDoxNzoyNiArMDEwMA==
  content: ! "Neat... adding to .bash_profile is normally the &acirc;&euro;&oelig;best&acirc;&euro;\x9D
    for ENV stuff, but that's really a minor point :-p."
- id: 124
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0wOS0yOSAwOTo1MDoxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0yOSAwODo1MDoxNSArMDEwMA==
  content: ! 'Sune: I always forget which is which ... my ~&#47;.bash_profile and
    ~&#47;.bashrc are both symlinks to ~&#47;usr&#47;etc&#47;profile, which looks
    at $- to see if it''s an interactive shell before deciding exactly what to do.  See
    http:&#47;&#47;home.woss.name&#47;file&#47;homedir&#47;trunk&#47;usr&#47;etc&#47;profile
    and http:&#47;&#47;home.woss.name&#47;browser&#47;homedir&#47;trunk&#47;usr&#47;etc&#47;profile.d&#47;
    for the gruesome details.  Actually that could do with some reworking to speed
    it up...'
- id: 125
  author: Allan Odgaard
  author_email: allan@macromates.com
  author_url: http://macromates.com/
  date: !binary |-
    MjAwNS0xMC0xMSAxMjo1NTo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0xMSAxMTo1NTo1MSArMDEwMA==
  content: ! 'Nice &acirc;&euro;&rdquo; I''m adding this to the manual using the ''mate''
    shell command:


    export LESSEDIT=''mate -l %lm %f'''
---
A quick <a href="http:&#47;&#47;macromates.com&#47;">TextMate<&#47;a> trick, inspired from reading <a href="http:&#47;&#47;macromates.com&#47;blog&#47;archives&#47;2005&#47;09&#47;28&#47;html-output-for-commands&#47;">HTML output for commands<&#47;a> (in particular the section on hyperlinking back to TextMate), I came up with the following:

[code]export LESSEDIT='open txmt\:&#47;&#47;open\?url=file\:&#47;&#47;&#47;`pwd`&#47;%f?lm\\&line=%lm.'[&#47;code]

Add that to your <code>~&#47;.bashrc<&#47;code> (or whatever) and, when you view a file in <code>less(1)<&#47;code>, then hit <code>v<&#47;code> to edit the file, it will bring it up in TextMate <em>at approximately the right line<&#47;em>, just as it used to do when you had <code>$VISUAL<&#47;code> set to <code>vim<&#47;code>.  It doesn't get the line exactly right -- it picks the middle of the screen you're currently looking at, but at least it gets nearer the context you've just decided you want to edit.
