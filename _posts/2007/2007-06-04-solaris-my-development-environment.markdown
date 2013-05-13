---
layout: post
title: ! 'Solaris: My development environment'
date: 2007-06-04 20:23:20 +01:00
categories:
- Geekery
- Ruby and Rails
- Solaris
tags:
- Geekery
- Ruby and Rails
- Solaris
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
