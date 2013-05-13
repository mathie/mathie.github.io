---
layout: post
status: publish
published: true
title: ! 'Thumper: Build one to throw away'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2007-05-25 09:21:30.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 828
  author: Justin
  author_email: JAzoff@uamail.albany.edu
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0yNSAxNjozMDoxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAxNTozMDoxMCArMDEwMA==
  content: ! '<p>Doesn''t the ILOM let you attach disk images?</p>


    <p>Technically I believe you should be able to run jumpstart right from OS X,
    all it really needs is dhcp tftp nfs, which OS X should be able to provide.  The
    tricky part is getting it all configured right since Sun only provides some scripts
    for setting up jumpstart instead of documentation on what actually needs to be
    running.</p>'
- id: 829
  author: Rich Teer
  author_email: rich.teer@rite-group.com
  author_url: http://www.rite-group.com/rich
  date: !binary |-
    MjAwNy0wNS0yNSAxNzowODo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAxNjowODo0MyArMDEwMA==
  content: <p>The web GUI version of the ILOM virtual console enables you to use a
    remote DVD drive as though it's local, so to reinstall you might be able to use
    the DVD drive in your Mac.</p>
- id: 830
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNS0yNSAxNzo1OToxNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAxNjo1OToxNCArMDEwMA==
  content: ! '<p>Justin, Rich: Oh, wow, I would never have considered that the ILOM
    could do something like that.  How neat!  OK, so quickly launching it seems to
    indicate that I''m not running a getty on that console, but they, that''s easy
    fixed. :-)</p>


    <p>Thanks for pointing out something I''d never have thought to look for!</p>'
- id: 831
  author: Chris Miles
  author_email: miles.chris@gmail.com
  author_url: http://chrismiles.info/
  date: !binary |-
    MjAwNy0wNi0xMiAwODo0MDoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMiAwNzo0MDoyNiArMDEwMA==
  content: <p>Not too long ago I jumpstarted my old Ultra 60 (which has a broken CD-ROM
    drive) from a Solaris server running under Parallels on my Mac Mini.  Worked like
    a charm :)</p>
- id: 832
  author: Anthony
  author_email: aad@beak.org
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0xOSAwMDo1MjoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0xOCAyMzo1MjoxMSArMDEwMA==
  content: ! '<p><i>The web GUI version of the ILOM virtual console enables you to
    use a remote DVD drive as though itâ€™s local, so to reinstall you might be able
    to use the DVD drive in your Mac.</i>

    Console Redirection seems to not work with <em>any</em> OSX browser, even though
    Java 1.5mumble is installed.  One has to use either Microcult Windows or a Sun
    desktop.</p>'
- id: 833
  author: John
  author_email: johnryan_852@iprimus.com.au
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0yOSAxNzoyODoxOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0yOSAxNjoyODoxOCArMDAwMA==
  content: ! '<p>The console redirection works with the Mac if you use Safari, not
    Firefox. However, the CDrom redirection doesn''t seem to work at all on a Mac.
    On a Mac, running Windows under Parallels, it works.

    I''m guessing it needs java 1.6

    There''s also a problem with console direction not working at with iLOM version
    1.1.1. There''s a fix at 1.1.1.1</p>'
---
I have planned to experiment with this machine for a while, then nuke it and reinstall.  I was planning to try out the latest OpenSolaris community release too (though after a chat with [Jason Lee](http://www.jlsync.com/) last week at RailsConf, I realise that might not be the most manageable solution in production) just to see what advantages I get from that.

But mainly I want to know how to reinstall the machine from scratch, and to have that documentation in place, just in case.  Trouble is, what with having 48 hard disks, oodles of RAM, 2 CPUs and a pair of redundant PSUs in 4U of rack space, Sun didn't manage to find room for a DVD drive.

So I'm going to have to relearn Jumpstart (which I've only used twice, the last time being ~8 years ago!).  I was thinking "hmm, I wonder if I can run it on Mac OS X", since that's the only other machines I've got around the house.  But then I thought, "well, of course I can, I've got Solaris running in a VMware image on my laptop anyway!"

But I don't need to figure all that out for a couple of weeks yet...
