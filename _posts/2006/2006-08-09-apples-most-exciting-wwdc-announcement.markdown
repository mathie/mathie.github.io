---
layout: post
title: Apple&#039;s most exciting WWDC announcement
date: 2006-08-09 10:30:57 +01:00
categories:
- Geekery
- Web surfing
tags:
- dtrace
- Geekery
- Mac OS X
- Web surfing
- wwdc
- wwdc2006
- zfs
comments:
- id: 568
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0wOC0wOSAxMTo1OTo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wOSAxMDo1OTo1NiArMDEwMA==
  content: <p>It's not 100% clear that the Sun license actually meets the OSD, of
    course...</p>
- id: 569
  author: jimmyjames
  author_email: here@here.com
  author_url: http://n/a
  date: !binary |-
    MjAwNi0wOC0wOSAxMjowMzo0OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wOSAxMTowMzo0OSArMDEwMA==
  content: ! '<p>I agree, Dtrace will be a great addition to Leopard. It is great
    to see Apple porting these low visibility/high impact tools for developers.</p>


    <p>I would also love ZFS. That isn''t how Time Machine works apparantly! it uses
    some twisted version of hard links (to directories even!) and a diff engine a
    la rsync, along with kevent. Don''t mention that ZFS would be better on Arstechnica,
    I did and got torn a new one! Apparantly Mac users are all 60 year old grannies
    who don''t need decent file systems!

    Check out this quote from Macworld on how it Time Machine works:</p>


    <blockquote><p>"How will Time Machine work for people who modify gigantic files
    on a regular basis? For example, consider a 1GB database file. If I make a tiny
    modification to that file, Time Machine writes out another 1GB file to record
    that change. As a result, drive space on my backup device could quickly disappear.
    Apple suggests that the answer will be for application developers to modify their
    programs to break up data into more discrete elements that can be backed up more
    simply by Time Machineâ€”something they may already be doing in order to make
    their files searchable via Spotlight."</p></blockquote>


    <p>Laughable.</p>'
- id: 570
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wOC0wOSAxMjozNDo0NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wOSAxMTozNDo0NyArMDEwMA==
  content: ! '<p>jimmyjames: Of course, that would have been the ''obvious'' implementation
    for Time Machine: ZFS and snapshots!</p>'
- id: 571
  author: jimmyjames
  author_email: here@here.com
  author_url: http://n/a
  date: !binary |-
    MjAwNi0wOC0wOSAxMzo0NzoyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wOSAxMjo0NzoyMyArMDEwMA==
  content: ! '<p>I agree. I wonder if this is just a temporary solution, and that
    eventually, zfs will be integrated.</p>


    <p>Come on Apple, you are sooooo close to having a really good solution!</p>'
- id: 572
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0wOC0xMCAxMzoxMTozOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0xMCAxMjoxMTozOSArMDEwMA==
  content: ! '<p>Doing time machine the way it''s done seems like a very sensible
    approach: it allows people to get this without support from the filesystem itself
    (so on existing disks and so on). I''d hope that it would be able to take advantage
    of any support in the underlying filesystem but it seems useful for that to be
    an optimisation rather than a requirement.</p>'
- id: 573
  author: Colin Docherty
  author_email: cd@doch.org.uk
  author_url: http://www.doch.org.uk
  date: !binary |-
    MjAwNi0wOC0xMSAxMjozOToxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0xMSAxMTozOToxNSArMDEwMA==
  content: <p>I thought the WWDC annoucement was quite exciting :-) Does that make
    me geeky? There still seems to be no mention of the minimum spec for 10.5, this
    concerns me. Are they going to drop to whole G3 imac bunch... The Time Machine
    looks cool, but it must be very hungry. I wonder if you will be able to turn off
    all the eye-candy, for the less graphically capable macs ?</p>
- id: 574
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0wOC0xOCAxMzoxODozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0xOCAxMjoxODozNiArMDEwMA==
  content: ! '<p>Colin: You can turn off most of the eye candy that''s there at the
    minute so I''d imagine that you''ll be able to turn off any new eye candy. That
    sort of feature is also used for reducing power consumption on laptops so it''ll
    tend to get done even if they''re not so worried about older hardware.</p>'
- id: 575
  author: The Complimenting Commenter
  author_email: commenter@gmail.com
  author_url: http://complimenter.blogspot.com
  date: !binary |-
    MjAwNi0wOS0wNyAxOTo1NToxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0wNyAxODo1NToxMCArMDEwMA==
  content: <p>Quite interesting to those who know.  Hopefully it will be great.  I
    just want to wish you a great birthday today and hope that the rest of your week
    goes well too!</p>
---
OK, so nobody else seems to care as far as I can see from wading through my feeds since the WWDC keynote, but the most exciting feature I noticed was buried at the bottom of the [preview of xcode 3.0](http://www.apple.com/macosx/leopard/xcode.html):

> Many such Xray instruments leverage the open source DTrace, now built into Mac OS X Leopard.

They've incorporated [DTrace](http://www.opensolaris.org/os/community/dtrace/) into Mac OS X!  Perhaps I'm biased because I've been following Solaris development a bit lately, but this is really exciting news.  DTrace seems to me (I've never actually used it, just read other people's experiences) to be a fantastic tool for debugging and profiling both development and production systems.  I'm really looking forward to using it (for example, [dtrace on rails](http://blogs.sun.com/roller/page/bmc?entry=dtrace_on_rails)).

But that's not what I'm getting really excited about.  I'm getting really excited about something that was hinted a while ago and hasn't, as far as I can see, been mentioned.  Something else from the same open source codebase that would suit being integrated into Mac OS X.  [ZFS](http://www.opensolaris.org/os/community/zfs/)!
