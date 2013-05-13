---
layout: post
title: Command of the day
date: 2007-06-04 18:04:58 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
---
Yes, it's that exciting today:

    mathie@kilchoman:~$ pfexec ipmitool power soft

This will, assuming you have the privileges (gained by `pfexec`) to do so, initiate a soft shutdown of the operating system via ACPI by simulating a fatal over-temperature reading.  It shuts down the computer, then powers it off, leaving only the ILOM running.  Which beats trying to figure out why shutting the OS down, then running `stop /SYS` from the ILOM didn't do what I thought it would (or, well, anything at all).

Other than that, my entire day has involved [trac](http://trac.edgewall.org/) and documentation.  Fun!
