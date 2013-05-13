---
layout: post
title: Finding the extra disk space on your OpenSolaris EC2 Image
date: 2008-05-21 12:35:03 +01:00
categories:
- Geekery
- Solaris
---
Sun and Amazon recently announced the [Launch of OpenSolaris on Amazon
EC2](http://blogs.sun.com/ec2/entry/launch_of_opensolaris_on_amazon) and I've
just taken the opportunity to test drive the OpenSolaris (Solaris eXpress
Community Edition b79) image. I'm planning to fire up some notes here as I
discover various aspects of the platform.

First of all, and nothing to do with the title of the post, it takes *ages* to
boot an image, even once it is "running" according to the API. It's just the
usual first boot on Solaris, I think, importing the SMF manifests, that kind
of thing. At least I hope so! Still, it's not quite as fast as starting up,
say, a zone.

Anyway, back to the title feature. I know that there is extra storage space
supplied, other than the boot volume, with each AMI. But it hasn't been made
available when the OpenSolaris image first boots. So I decided to have a wee
poke around. First of all, let's print the partition map for the first disk
(`c0d0`), see if there's an unused partition on it:

    bash-3.2# prtvtoc c0d0s2
    * c0d0s2 partition map
    [ ... ]
    *                          First     Sector    Last
    * Partition  Tag  Flags    Sector     Count    Sector  Mount Directory
           0      2    00    1076355  18330165  19406519   /
           1      3    01      16065   1060290   1076354
           2      5    00          0  19406520  19406519
           8      1    01          0     16065     16064

OK, nothing particularly interesting there. Partition 0 is the root
filesystem, 1 is swap and 8 is, well, tiny -- I haven't a clue why it's there
but we'll ignore it anyway. :-)

My Solaris-fu is pretty basic, so I may have gone about this the wrong way,
but looking in `/dev/dsk` there appears to be more disks than just the first
one:

    bash-3.2# ls -l /dev/dsk/*s2
    lrwxrwxrwx   1 root     root          29 May 21 11:00 /dev/dsk/c0d-817967040s2 -> ../../devices/xpvd/xdf@sda3:c
    lrwxrwxrwx   1 root     root          26 Apr 14 23:08 /dev/dsk/c0d0s2 -> ../../devices/xpvd/xdf@0:c
    lrwxrwxrwx   1 root     root          26 May 21 11:00 /dev/dsk/c0d1s2 -> ../../devices/xpvd/xdf@1:c
    lrwxrwxrwx   1 root     root          26 Apr 14 23:08 /dev/dsk/c0d6s2 -> ../../devices/xpvd/xdf@6:c

So, let's take a look at `c0d1`:

    bash-3.2# prtvtoc c0d1
    * c0d1 partition map
    [ ... ]
    *                          First     Sector    Last
    * Partition  Tag  Flags    Sector     Count    Sector  Mount Directory
           0      4    00        256 312688351 312688606
           8     11    00  312688607     16384 312704990

Awesome, it's another virtual disk and it has oodles of space! Let's use the
whole disk with ZFS:

    bash-3.2# zpool create tank c0d1
    bash-3.2# zfs list
    NAME   USED  AVAIL  REFER  MOUNTPOINT
    tank  89.5K   147G     1K  /tank

Nice.  So we now have our extra space, all ready to go with ZFS.

(As an aside, `c0d6` points to a non-existant device node and `c0d-817967040`
appears to be a 900MiB disk which looks a bit suspicious.)
