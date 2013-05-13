---
layout: post
status: publish
published: true
title: ! 'Solaris: My development environment'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2007-06-04 20:23:20.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- Solaris
tags:
- Geekery
- Ruby and Rails
- Solaris
comments:
- id: 853
  author: Lourens Naude
  author_email: lourens@rentacarhire.com
  author_url: http://blog.methodmissing.com
  date: !binary |-
    MjAwNy0wNi0wNSAwMDozNTozNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAyMzozNTozNCArMDEwMA==
  content: ! '<p>Nice collection of Solaris posts :-)</p>


    <p>Have the Express Edition on Parallels, exclusively for playing around with
    dtrace.I have 2GB RAM on my system but cannot manage killing off the Java Desktop
    System, which is a major resource hog.</p>


    <p>Any willingness to publish some notes on stripping the Dev Edition down to
    the bare minimum ?</p>


    <ul>

    <li>Lourens</li>

    </ul>'
- id: 854
  author: z0mbix
  author_email: zombie@zombix.org
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0wNSAxNDoyMDo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNSAxMzoyMDo1NiArMDEwMA==
  content: ! '<p>Very interesting post. I''m just downloading VMWare Fusion now to
    do the same.</p>


    <p>Lourens:</p>


    <p>To see what services are running on bootup:</p>


    svcs | less


    <p>To disable the GUI, this should sort you out:</p>


    svcadm disable graphical-login/cde-login


    <p>Disable other services that you do not want running in the same way.</p>


    <p>Cheers z0mbix</p>'
- id: 855
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNi0wNyAwOTowMTozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNyAwODowMTozMyArMDEwMA==
  content: ! '<p>Lourens: I shall try and put up some more detail about which services
    I actually disable today.</p>'
- id: 856
  author: Nickus
  author_email: nickus@gmail.com
  author_url: http://aspiringsysadmin.com/blog
  date: !binary |-
    MjAwNy0wNi0wNyAyMTowMjowMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNyAyMDowMjowMiArMDEwMA==
  content: ! '<p>Hi,</p>


    <p>Thanks for a great post. I didn''t know that VMware had a public beta of their
    product available for OSX and I''m downloading it right now. Last week I got an
    extra GB of ram (for a total of 2) for my MacBook to be able to better run Parallels.
    But now I will definitely try VMware as well. Having a Solaris installation available
    on my Mac will make it easier to test out my blog posts before I publish them
    as well.</p>


    <p>Keep up the good work.</p>'
- id: 857
  author: Chris Miles
  author_email: miles.chris@gmail.com
  author_url: http://chrismiles.info/
  date: !binary |-
    MjAwNy0wNi0wOSAyMDo1MTowOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wOSAxOTo1MTowOCArMDEwMA==
  content: ! '<p>I''m the same, primary development on OS X but testing OS-specific
    features on Solaris 10 &amp; Linux using VMWare/Parallels.  VMWare Fusion is "better"
    for running Solaris as it supports 64-bit, multiple CPUs and provides VMWare "Tools"
    for Solaris.  I haven''t look at Parallels 3 yet, though.</p>


    <p>To disable the graphical login in Solaris I use "/usr/dt/bin/dtconfig -d".  There''s
    probably many ways to achieve the same result.</p>


    <p>Nice tips, I hadn''t bothered trying to NFS mount the guest filesystem.</p>


    <p>Gotta wonder if Leopard will allow us to mount the ZFS filesystem image natively
    in OS X...</p>'
- id: 858
  author: Douglas F Shearer
  author_email: dougal.s@gmail.com
  author_url: http://douglasfshearer.com
  date: !binary |-
    MjAwNy0wNi0xMSAwMTo1NTo1OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMSAwMDo1NTo1OSArMDEwMA==
  content: ! '<p>Excellent post!</p>


    <p>I tried mounting NFS from OS X yesterday, but kept being tod I was using the
    wrong password, despite never setting one up.</p>'
- id: 859
  author: Juan LupiÃ³n
  author_email: pantulis@gmail.com
  author_url: http://sobrerailes.com
  date: !binary |-
    MjAwNy0wNy0xNiAyMToyNzoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0xNiAyMDoyNzoyNiArMDEwMA==
  content: <p>Thank you Graeme for this info, it made me try and install OpenSolaris
    on my Macbook... with success.</p>
- id: 860
  author: CpILL
  author_email: whillas@gmail.com
  author_url: http://alex.tsd.net.au/cpill/
  date: !binary |-
    MjAwNy0wNy0yMiAxNTowMTozMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yMiAxNDowMTozMiArMDEwMA==
  content: <p>NIce setup idea. I have been doing web development and running WinXP
    via VMWare. The problem i'm facing now is that I would like to be able to see
    the OSX apache from inside the VM. I'm guessing that NetInfo doesn't act as a
    DNS that the Windows machine can see so do you think setting up a DNS server under
    OSX would solve this problem or is there a way with what OSX has to offer out
    of the box?</p>
---
I'm doing a little bit of coding, part of which involves compiling and testing my project on Solaris.  Now, as many of you have probably gathered, my main development machine is a Macbook Pro, running Mac OS X 10.4.  In fact, all the desktop machines I own run Mac OS X.  What can I say, I happen to rather like it!

So how do I do Solaris development on Mac OS X?  Well, there are two popular virtualization methods for Mac OS X: [Parallels](http://www.parallels.com/en/products/workstation/mac/) and [VMware Fusion](http://www.vmware.com/products/beta/fusion/).  I do have a license for Parallels, but to be honest (and I won't even try to quantify this because I haven't measured it) VMware feels faster, mostly because feels like the guest OS has less memory overheard.

Anyway, so I have VMware Fusion, and [Solaris Express, Developer Edition](http://developers.sun.com/solaris/downloads/solexpdev/) (at least I think that's what I installed, it's `snv_63`) installed as a machine image.  It's been given 384MB RAM and I gave it one 8GB disk which was split into a 7.5GB partition for root and the rest for swap.  After the install was complete, I also assigned it a second 8GB drive which I've used for a ZFS pool.

(FWIW, I've just checked and it's using a total of 6.7GB on disk, while it's running.)

So, how is Solaris configured?  Well, I'm not a fan of the GUI (and who would be with only 384MB RAM?), so there was a pile of `svcadm disable foo` going on the first time I booted it.  The only remaining daemon services are:

* `ssh` so that I can get a shell on the machine that behaves like an xterm, rather than the VMware console, which is just gross.
* `nfs/server` (along with its dependencies) which is the secret magic bit that allows me to access the Solaris filesystem from my Mac.
* A few other services that I'm scared to switch off because I don't know what they do! (`picl`, `sac`, `ttymon`, `utmpd`, `intrd`)  Still they don't seem to listen on network ports, so figuring them out is further down my priority list. :-)

First, you'll want to create a user on the Solaris VM.  To make life easier later, we're going to make sure we match the UID and GID of the user on your host system.  Chances are, if you're the only person using the Mac host and you were the first account created, it'll be 501.  But let's just check first of all by running the following on the host system:

    mathie@bowmore:mathie$ ls -ldn ~
    drwxr-xr-x   70 501  501    2K  4 Jun 13:17 /Users/mathie/

We're asking to take the directory listing for just the dentry of our home directory, and to display the UID and GID in numeric form.  On any other system, I'd have suggested you grep `/etc/passwd` but on Mac OS X we use Netinfo and I don't want to get into that!  Anyway, note down these two numbers (both 501 in my case) which I'll call the UID and GID respectively later.

Now get on to the console for the Solaris install and log in as root.  Then run:

    # groupadd -g <gid> <username>
    # useradd -g <username> -s /usr/bin/bash -P 'Primary Administrator' -u <uid> -m <username>
    # passwd <username>
    New Password:
    Re-enter new Password:
    passwd: password successfully changed for <username>

When you're doing this, replace `<username>` with your preferred user name, `<uid>` with the user id from above, and `<gid>` with the group id.  Sorted.  You can now log out and back in as that user instead of root.  You will never need to log in as root again, in fact, because we've given your user id the primary administrator role too which you can take advantage of in future with `pfexec`.

I've created a ZFS pool, unimaginatively called `pool` and inside there I've got a filesystem called mathie, owned by me, which I've compressed and shared with NFS:

    mathie@solaris-devx:~$ pfexec zfs create pool/mathie
    mathie@solaris-devx:~$ pfexec zfs set sharenfs=on pool/mathie
    mathie@solaris-devx:~$ pfexec zfs set compression=on pool/mathie
    mathie@solaris-devx:~$ pfexec chown -R mathie:mathie /pool/mathie

While we're in a shell, let's figure out the IP address of the VM:

    mathie@solaris-devx:~$ ifconfig -a|grep inet
            inet 127.0.0.1 netmask ff000000
            inet 192.168.12.133 netmask ffffff00 broadcast 192.168.12.255
            inet6 ::1/128

So that would be `192.168.12.133` (since I've configured VMware to do NAT, that makes sense and, for bonus points, doesn't ever appear to change).  Now from the Mac end, I can connect to this NFS share.  In Finder, select the 'Go' menu, then 'Connect to Server...'  Then enter an NFS URI containing the IP address of the VM and the path to your ZFS filesystem.  In my case, that's:

    nfs://192.168.12.133/pool/mathie

and hit connect.  It will mount the share for you and, unlike what you may expect, it doesn't ask you for a password.  NFS is like that.  Hopefully, if we've done the UID matching correctly, you'll also be able to read & write files on that share too.  Score!

After that, it's just a case of having iTerm and TextMate open.  One tab in iTerm is ssh'd into the VM so that I can continually run `rake` to build the code and run the test suite.  Another tab is changed into the right directory on the share, but on my local system, so that I can do stuff with Subversion.  And TextMate happily edits files on the NFS share, so everybody is happy with the best of both worlds!

Oh, and I'm only not telling you what I'm up to because I hate vapourware too.  It's fun, useful and will be open source.  Stay tuned. :-)
