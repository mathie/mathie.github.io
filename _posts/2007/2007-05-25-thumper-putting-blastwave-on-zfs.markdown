---
layout: post
status: publish
published: true
title: ! 'Thumper: Putting Blastwave on ZFS'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 426
wordpress_url: http://woss.name/2007/05/25/thumper-putting-blastwave-on-zfs/
date: 2007-05-25 09:01:42.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 825
  author: Boyd Adamson
  author_email: boyd-adamson@usa.net
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0yNiAwMDozMDo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAyMzozMDo0MyArMDEwMA==
  content: ! '<p><em>Minimal<&#47;em> RBAC configration to provide something similar
    to sudo:<&#47;p>


    usermod -P "Primary Administrator" myusername


    <p>Then, as myusername, prefix commands that need privs with "pfexec":<&#47;p>


    <p>$ pfexec pkgadd -d . all<&#47;p>


    <p>For more explanation, you may like to start here:

    http:&#47;&#47;blogs.sun.com&#47;security&#47;entry&#47;slotd_the_5_cent_tour<&#47;p>'
- id: 826
  author: Boyd Adamson
  author_email: boyd-adamson@usa.net
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0yNiAwMDozNToxOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAyMzozNToxOCArMDEwMA==
  content: ! '<p>Oh, and I doubt that xattr is your problem. Very few programs use
    extended attributes, and I''m pretty sure that the package system isn''t one of
    them. Normally when it''s talking about attributes it means permissions and mtime.<&#47;p>


    <p>I''d be more concerned about the "pathname does not exist" messages. You may
    like to throw truss (or dtrace) at it to see what pathname it''s complaining about.<&#47;p>'
- id: 827
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNS0yNiAxMjozMToxNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNiAxMTozMToxNyArMDEwMA==
  content: ! '<p>Boyd: Thanks for the RBAC intro.  That''s about enough to throw away
    sudo for now.<&#47;p>


    <p>As for the ''pathname does not exist'', I shall continue to poke at it and
    see what''s going wrong when I boot the noise-meister up today.  I''d, umm, forgotten
    about using <code>truss<&#47;code> and hadn''t considered trying <code>dtrace<&#47;code>.  This
    could be a good excuse to learn how it works!<&#47;p>'
---
Since the root file system is a meagre 11GB, I figured I'd try and use my ZFS pool for installing [Blastwave](http:&#47;&#47;www.blastwave.org&#47;) which is a system built on top of Solaris' own packaging mechanism with access to lots of extra software that I can't live without.  Like `sudo` for example, at least until I figure out how the Solaris native RBAC mechanism works!  So, I did something along the lines of:

    zfs create zpool1&#47;software
    zfs create zpool1&#47;software&#47;blastwave
    zfs set mountpoint=&#47;opt&#47;csw zpool1&#47;software&#47;blastwave
    pkgadd -d http:&#47;&#47;www.blastwave.org&#47;pkg_get.pkg

But I noticed that, at installation time, I was getting errors:

    pkgadd: ERROR: unable to create package object <&#47;opt&#47;csw&#47;bin>.
        pathname does not exist
        pathname does not exist
        unable to fix attributes
    &#47;opt&#47;csw&#47;bin

Looking at it now, in the cold light of morning, the answer might have been obvious.  However, it took me a while last night to figure it out.  Eventually, I compared the options the filesystems were mounted with, thinking that it might be missing a `setuid`&#47;`exec` flag and noticed that it was missing the `xattr` flag.  Hmm.  "`xattr`" and "unable to fix attribtues" sound like they might be a match, eh?

Digging around in the *ZFS Administration Guide* (I've got a PDF here, it's page 19 if you're following along at home), it appears that the `xattr` property on ZFS filesystems -- which enables extended attributes on a per-filesystem basis -- was introduced in Nevada build 56 and doesn't appear to be available in Solaris 10 U3.  I am inferring from this information that ZFS in Solaris 10 U3 doesn't actually support extended attributes.

Two questions I have at this stage:

* Am I correct in my inference?
* Does it matter, or can I just ignore those errors?

**Update** I've researched the matter more thoroughly and it turns out I'd jumped to completely the wrong conclusion.  Read the next round of investigation at: [Thumper: Debugging and not jumping to conclusions](http:&#47;&#47;woss.name&#47;2007&#47;05&#47;26&#47;thumper-debugging-and-not-jumping-to-conclusions&#47;).
