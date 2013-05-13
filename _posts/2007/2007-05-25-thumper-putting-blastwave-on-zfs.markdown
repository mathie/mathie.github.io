---
layout: post
status: publish
published: true
title: ! 'Thumper: Putting Blastwave on ZFS'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
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
  content: ! '<p><em>Minimal</em> RBAC configration to provide something similar to
    sudo:</p>


    usermod -P "Primary Administrator" myusername


    <p>Then, as myusername, prefix commands that need privs with "pfexec":</p>


    <p>$ pfexec pkgadd -d . all</p>


    <p>For more explanation, you may like to start here:

    http://blogs.sun.com/security/entry/slotd_the_5_cent_tour</p>'
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
    them. Normally when it''s talking about attributes it means permissions and mtime.</p>


    <p>I''d be more concerned about the "pathname does not exist" messages. You may
    like to throw truss (or dtrace) at it to see what pathname it''s complaining about.</p>'
- id: 827
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNS0yNiAxMjozMToxNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNiAxMTozMToxNyArMDEwMA==
  content: ! '<p>Boyd: Thanks for the RBAC intro.  That''s about enough to throw away
    sudo for now.</p>


    <p>As for the ''pathname does not exist'', I shall continue to poke at it and
    see what''s going wrong when I boot the noise-meister up today.  I''d, umm, forgotten
    about using <code>truss</code> and hadn''t considered trying <code>dtrace</code>.  This
    could be a good excuse to learn how it works!</p>'
---
Since the root file system is a meagre 11GB, I figured I'd try and use my ZFS pool for installing [Blastwave](http://www.blastwave.org/) which is a system built on top of Solaris' own packaging mechanism with access to lots of extra software that I can't live without.  Like `sudo` for example, at least until I figure out how the Solaris native RBAC mechanism works!  So, I did something along the lines of:

    zfs create zpool1/software
    zfs create zpool1/software/blastwave
    zfs set mountpoint=/opt/csw zpool1/software/blastwave
    pkgadd -d http://www.blastwave.org/pkg_get.pkg

But I noticed that, at installation time, I was getting errors:

    pkgadd: ERROR: unable to create package object </opt/csw/bin>.
        pathname does not exist
        pathname does not exist
        unable to fix attributes
    /opt/csw/bin

Looking at it now, in the cold light of morning, the answer might have been obvious.  However, it took me a while last night to figure it out.  Eventually, I compared the options the filesystems were mounted with, thinking that it might be missing a `setuid`/`exec` flag and noticed that it was missing the `xattr` flag.  Hmm.  "`xattr`" and "unable to fix attribtues" sound like they might be a match, eh?

Digging around in the *ZFS Administration Guide* (I've got a PDF here, it's page 19 if you're following along at home), it appears that the `xattr` property on ZFS filesystems -- which enables extended attributes on a per-filesystem basis -- was introduced in Nevada build 56 and doesn't appear to be available in Solaris 10 U3.  I am inferring from this information that ZFS in Solaris 10 U3 doesn't actually support extended attributes.

Two questions I have at this stage:

* Am I correct in my inference?
* Does it matter, or can I just ignore those errors?

**Update** I've researched the matter more thoroughly and it turns out I'd jumped to completely the wrong conclusion.  Read the next round of investigation at: [Thumper: Debugging and not jumping to conclusions](http://woss.name/2007/05/26/thumper-debugging-and-not-jumping-to-conclusions/).
