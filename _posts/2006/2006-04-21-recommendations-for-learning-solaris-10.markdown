---
layout: post
status: publish
published: true
title: Recommendations for Learning Solaris 10?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 262
wordpress_url: http://woss.name/2006/04/21/recommendations-for-learning-solaris-10/
date: 2006-04-21 09:37:46.000000000 +01:00
categories:
- Geekery
- Solaris
- Work
tags: []
comments:
- id: 401
  author: Annabel
  author_email: annabel@rubaidh.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0yMSAxMDozMDozMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yMSAwOTozMDozMCArMDEwMA==
  content: ! '<p>nope, no new books allowed for a 60 day trial!!</p>


    <p>and anyway you should be doing rubaidh work not playing with noisy boxes!!!</p>'
- id: 402
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0wNC0yMSAxMToyNjowNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yMSAxMDoyNjowNCArMDEwMA==
  content: ! '<p>apropos is fairly useful for finding things like the patch management
    stuff. They do have an automated patch download tool (finally!), although it was
    pretty painful to use.</p>


    <p>The standard Sun packaging place always used to be <a href=''http://www.sunfreeware.com/''
    rel="nofollow">Sun Freeware</a>.</p>'
- id: 403
  author: Dick Davies
  author_email: rasputnik@gmail.com
  author_url: http://number9.hellooperator.net/
  date: !binary |-
    MjAwNi0wNC0yMSAxMjozNjoxNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yMSAxMTozNjoxNyArMDEwMA==
  content: ! '<p>http://docs.sun.com/</p>


    <p>is really pretty good - look at the solaris 10 collection.</p>


    opensolaris on freenode were in a helpful mood last time I was there too :)


    <p>It''s not the sort of thing you want to read all the way through, but if you''re
    asking a ''how do I XXX?''

    question, it''s great.</p>


    <p>If you know any good books, let me know

    (avoid the Osborne Solaris 10 book at all cost, though, it''s absolutely awful).</p>'
- id: 404
  author: Wes Williams
  author_email: wes@classiarius.com
  author_url: http://www.classiarius.com
  date: !binary |-
    MjAwNi0wNC0yMiAyMzoyODozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yMiAyMjoyODozMyArMDEwMA==
  content: <p>in addition the the aforementioned http://docs.sun.com also use the
    usenet newsgroups and solars IRC channels for answers to questions you can't find
    elsewhere...just please attempt to resolve on your own.  the good 'ole "man" command
    is priceless.</p>
- id: 405
  author: Sean Farrell
  author_email: sean@seanfarrell.co.uk
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0yMyAwMTozMzozNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yMyAwMDozMzozNCArMDEwMA==
  content: ! '<p>For stuff that gives you packages that are quick to get working and
    easy to play with I''d have gone with the packages available from the SunFreeware
    site.  Several packages there have been adopted and are distributed with Solaris
    on the Companion CD

    http://www.sun.com/software/solaris/freeware</p>


    <p>Big Admin is nice for advice on setting up, securing a system and keeping up
    to date.

    http://www.sun.com/bigadmin/home/</p>'
- id: 406
  author: Thorleif Wiik
  author_email: thorleif.wiik@gmail.com
  author_url: http://www.wiik.de
  date: !binary |-
    MjAwNi0wNC0yMyAxNzoxMDo1OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yMyAxNjoxMDo1OCArMDEwMA==
  content: ! '<p>Blastwave with about 1418 software packages will be the better alternative
    to OpenPKG.</p>


    <p>http://www.blastwave.org/</p>'
- id: 407
  author: John Levon
  author_email: levon@movementarian.org
  author_url: http://blogs.sun.com/levon
  date: !binary |-
    MjAwNi0wNC0yNCAxNToyODozNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yNCAxNDoyODozNyArMDEwMA==
  content: ! '<p>See:</p>


    <p>http://www.opensolaris.org/os/community/immigrants/</p>


    <p>There you''ll find out why ''top'' didn''t seem to be there, and why

    kill -HUP on the ssh daemon wasn''t the ''right'' thing to do.</p>


    <p>FWIW, we are slowly moving as much as we can from ''hidden''

    paths like /usr/sfw/ into somewhere in the default search path.</p>'
- id: 408
  author: Gerard Byrne
  author_email: gbyrne@experience.ie
  author_url: http://experience.ie
  date: !binary |-
    MjAwNi0wNC0yNiAwNzozOTowNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yNiAwNjozOTowNSArMDEwMA==
  content: ! '<p>Having fun?</p>


    <p>Unix is like wives/girlfriends - the one you''ve hung around with the longest
    is the best :-)  And new girlfriends tend bite in unusual ways ;-)</p>


    <p>I don''t have any direct Solaris experience but I would suggest slapping webmin
    up on it so that you can get it to do the sysadmin until you''re ready to get
    down and dirty. You will want to restrict how/who gets access to webmin though.</p>


    <p>My only non-Linux/FreeBSD experience was with HPUX. What annoyed me in the
    early stages was the (to me) unusual places config and other things were located.
    LSB has been good in standardising the location of things in the Linux world.
    Also, I did not realise just how spoiled we were in the Linux world with all the
    GNU utils - the /usr/bin is filled with stuff missing but available on other unixes
    (or should that be eunuches given that they have had their balls cut off!).</p>


    <p>Have fun.</p>


    <p>GB</p>'
- id: 409
  author: DJ
  author_email: firebladetoronto@hotmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNy0yOCAwMzozMDoyNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0yOCAwMjozMDoyNyArMDEwMA==
  content: <p>Is there much difference between 9 and 10.  I am looking for a beginners
    intro to Solaris 10, and was thinking of getting the Solaris 9 for dummies as
    a general all-round intro.  Any thoughts?</p>
- id: 410
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNy0yOCAwOTowODowOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0yOCAwODowODowOSArMDEwMA==
  content: ! '<p>DJ: There are lots of new and exciting features in 10 (and even more
    in the newer Express releases -- ZFS rocks!), but you''ll be able to get the basics
    from a Solaris 9 book.  Lots of the bits I was playing around with seemed familiar
    even from SunOS 4.1.4, so it can''t have changed that much!</p>'
- id: 411
  author: DJ
  author_email: firebladetoronto@hotmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNy0zMSAwMjo1MTozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0zMSAwMTo1MTozMyArMDEwMA==
  content: ! '<p>Mathie:  Thanks for the input.  I am sure 10 has some cool new stuff,
    but for a newbie like myself, I need an easy intro so I at least know what the
    new features mean, or where they are effected.  Off I go to the book store...thanks!!</p>'
---
OK, I think I need a book.  How does one go about learning the ins and outs of Solaris 10?  My [Safari](http://safari.oreilly.com/) subscription is remarkably sparse on Solaris in general and there appears to be something in the region of bugger-all covering Solaris 10.  The recent experience I have is pretty much of Linux and FreeBSD, though in the past couple of years I've even shyed away from much sysadmin of them, preferring to use managed services or shared hosting instead.  So, what do I want to learn about?  Well, some of these topics:

* Probably a dummies intro to Solaris, from the perspective of an experienced Linux geek (ie a cheat-sheet which says, for example "when you want the equivalent of `ps ax`, type `ps -ef`").
* Configuring the system to acquire and apply patches.
* Setting up RAID 1 mirroring of the two disks in the machine.  I did this once, long ago, along with lots of other LVM shenanigans with a pair of Sparc Storage Arrays and Solstice Disk Suite.
* I'd like to play around with these Zone/Container things for separating application parts into their own domain.
* Locking the server down for going into production.  There are lots of strange services running and ports open and this gives me the heebie jeebies.  I'd like to know what they all do, what can safely be switched off, and how to firewall the rest from teh Intarweb.

I'd also like some sort of recommendation on best practices for installing additional software on Solaris.  I'm going to be wanting [Lighttpd](http://www.lighttpd.net/), [Ruby](http://www.ruby-lang.org/) (along with a bunch of gems, but I'm happy using Rubygems to manage them) and [MySQL](http://www.mysql.com/) amongst others.  Am I better building things myself and accepting that I'll have to be aware of updates to these packages and their dependencies?  Or is it better to go with some third party packaging system?  So far, I've found [OpenPKG](http://www.openpkg.org/).  Are they a good bet?  Are there other alternatives that would be better?

**Update:** Woo!  I've just found `/usr/sfw` with a whole load of useful stuff in it, like `gcc` for instance.  Though it took `find / -name wget` to find it!  Adding that to my path is making life feel a little less strange...
