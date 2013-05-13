---
layout: post
title: Build of Carbon XEmacs 21.5.20 beta 2 for Mac OS X 10.4
date: 2005-08-04 12:03:50 +01:00
categories:
- Geekery
- To do
comments:
- id: 18
  author: anon
  author_email: rrw1941y@yahoo.co.uk
  author_url: ''
  date: !binary |-
    MjAwNy0wMi0wMyAxODoyMzoyMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wMyAxNzoyMzoyMCArMDAwMA==
  content: ! '<p>I''ve built and rebuilt emacs and Xemacs many times over 15 years,
    but I couldn''t face doing it on my 3 day old MacBook Pro; I don''t understand
    the file system yet. Just as I was about to download JEdit I chanced on your binary.</p>


    <p>Works beautifully, handles UTF8, which I need, and my emacs-bound fingers are
    happy again. Refuses to compile Java, and the colours are far from my taste, but
    I''m sure I''ll sort those things out before too long.</p>


    <p>Thanks very much.</p>


    <p>anon, Glasgow.</p>'
- id: 19
  author: Bil
  author_email: Bil@Lambdacs.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0xOCAxNzoyMzoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0xOCAxNjoyMzoyNiArMDEwMA==
  content: ! '<p>Building Xemacs is such a pain. There''s always some hidden detail
    you don''t know about.</p>


    <p>So thank you so much!</p>


    <p>-Bil</p>'
- id: 20
  author: Lar
  author_email: edwards@cdr.stanford.edu
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0yNiAxMjoxMDozMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNiAxMToxMDozMCArMDEwMA==
  content: ! '<p>Finally Xemacs on Mac OS X, thanks very much!

    One thing is that I use the option key as meta, I''ve been able to set that for
    GNUEmacs Carbon and the version that comes with Mac OS X, but not XEmacs Carbon.</p>


    <p>I''ve tried:</p>


    <p>(setq mac-command-key-is-meta nil)</p>


    <p>and</p>


    <p>(setq mac-option-modifier ''meta)</p>


    <p>and both together without success. Anyone have any ideas?</p>


    <p>Thanks!</p>'
- id: 21
  author: M
  author_email: mala.mateen@kirtland.af.mil
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yMyAyMjoyOToyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yMyAyMToyOToyNSArMDEwMA==
  content: ! '<p>Hi,</p>


    <p>I just downloaded xemacs-21.5.27 on my MAC OS 10.4 along with the suggested
    patch xemacs-21.5.27.tar.bz. xemacs opens up however is not color coded. What
    do I need to do for the colors to show up?</p>


    <p>thanks,</p>'
- id: 22
  author: spat
  author_email: patenaude@aei.ca
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0wNCAwMTozMzozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0wNCAwMDozMzozMyArMDEwMA==
  content: ! '<p>Pros &amp; Cons...</p>


    <p>Pros: Worked instantly out-of-the-box ! Nothing special to do ! Really cool,
    thanks !</p>


    <p>Cons: As soon as I try to import my own configs (.xemacs/init.el and elisp
    dir) I get the regexp-opt bad number of arguments error.

    These files are known to be ok since I use them on a daily basis on a RedHat machine
    (of course I dont remember the xemacs version but I suspect that its more recent
    than 21.5.20 is that possible ?)</p>


    <p>Once again ! big big thanks !</p>


    <p>spat</p>'
- id: 23
  author: spat
  author_email: patenaude@aei.ca
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0wNCAxMjowMDoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0wNCAxMTowMDoyMiArMDEwMA==
  content: <p>To complete previous post... My elisp stuff is running under 21.4.13
    (is there a way to make 21.5.20 compatible ?)</p>
- id: 24
  author: Peter White
  author_email: muritza@verizon.net
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0xMiAxODowMToyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0xMiAxNzowMToyNCArMDEwMA==
  content: ! '<p>I tried installations of xemacs using darwin ports, apt-get, and
    fink. All these installed something that was missing many of my favorite xemacs
    features. The package at http://woss.name/dist/CarbonXEmacs-21.5.20-b2-1.dmg works
    fine, lasts a long time.</p>


    <p>Many thanks</p>


    <p>Peter</p>'
---
Since the <a href="http://members.shaw.ca/akochoi-xemacs/" title="Carbon XEmacs">Carbon XEmacs</a> developer doesn't provide a binary release of his work, I have created one for the convenience of those who don't like to get their fingernails too dirty.  Hopefully it will work, and I do intend to improve upon it and keep it up to date with his work (though I make no promises!).  It can be downloaded here: <a href="http://woss.name/dist/CarbonXEmacs-21.5.20-b2-1.dmg" title="Carbon XEmacs 21.5.20 beta 2">CarbonXEmacs-21.5.20-b2-1.dmg</a>.  The main version (21.5.20 in this case) is the version of XEmacs, the next one (b2) is the version of the Carbon port and the final version (1 here) is my package version.  Let me know how you get along.  I've a funny feeling it'll only work on Mac OS X 10.4 -- at some point in the future I'll endeavour to make it work for older releases too.  In fact, my todo list for improving the package is:

<ul>
  <li>Make the packages optional (at least being able to choose not to install sumo and sumo-mule, if not more fine grained).</li>
  <li>Improve the README.</li>
  <li>Automate the build process, so that I can produce new releases without too much work.</li>
</ul>

I'll keep the <a href="/category/carbon-xemacs/" title="Carbon XEmacs category">Carbon XEmacs</a> category up to date as I make new releases, so stay tuned. :-)
