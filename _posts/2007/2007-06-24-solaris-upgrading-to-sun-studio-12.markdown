---
layout: post
title: ! 'Solaris: Upgrading to Sun Studio 12'
date: 2007-06-24 16:57:12 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
---
I should probably be ashamed that it's taken me this long to notice: I don't have a compiler installed in my zones!  I discovered this afternoon while I was trying to build mongrel for an app I was about to deploy!  I had assumed that Sun Studio 11, which is installed in the global zone would be automatically available to the other zones.

Apparently not.  I don't know if it's a quirk of my installation, or whether I've screwed something up, but Sun Studio doesn't appear to be managed by the packaging system.  `pkginfo|grep SUNWspro` doesn't show up anything.  Well, I suppose that'll explain why it's not being copied across to the zones as it should...  So, let's get it installed properly, and let's upgrade to Sun Studio 12 while we're at it.

First of all, let's go grab the new packages from here: [Sun Studio downloads](http://developers.sun.com/sunstudio/downloads/index.jsp).  Follow through the usual rigmarole for downloading packages for Sun, logging, accepting license agreements, that kind of thing.  I did discover that I can copy the URL from the download page and pass it to `wget` on the server, which saved me some time.  And got [download speeds of ~1.5MB/s](http://belowzero.biz/). :-)

While that's in progress, let's uninstall Sun Studio 11, which is required before we can install 12.  Approximately following the instructions from [Uninstalling the Sun Studio 11 software](http://docs.sun.com/source/819-3052/remove.html#56314) we do the following in the global zone:

    mathie@kilchoman:~$ cd /var/sadm/prod/com.sun.studio_11/
    mathie@kilchoman:com.sun.studio_11$ pfexec ./batch_uninstall_all

It chunters away for a few minutes, uninstalling the various components of Studio 11.

Once the previous steps are complete, we're free to install Sun Studio 12.  First of all, create a directory and unpack the download into it:

    mathie@kilchoman:~$ mkdir SunStudio12
    mathie@kilchoman:~$ cd SunStudio12/
    mathie@kilchoman:SunStudio12$ gtar jxf ~/SunStudio12-solaris-x86-200705-pkg.tar.bz2

Now we follow the steps outlined in [Installing on a Solaris 10 1/06 OS Server With Zones](http://docs.sun.com/app/docs/doc/820-0273/6nc1a9djl?a=view) by running the following in the global zone:

    mathie@kilchoman:SunStudio12$ pfexec ./prepare_system -s patches
    mathie@kilchoman:SunStudio12$ pfexec ./batch_installer --accept-sla --zone=all

The first command didn't appear to do much in my case; then again I've updated patches on the system quite recently.  The batch installer sits there for a while, then almost silently, finishes.  You can verify that the install has worked in the global zone by running `version`.  It should report the various Sun Studio 12 tools as being installed.

But the real proof of the pudding?  In a zone:

    mathie@cardhu:~$ version
    [ snip ]
    The following components are installed on your system:

    Sun Studio 12
            Sun Studio 12 C Compiler
            Sun Studio 12 C++ Compiler

Score!
