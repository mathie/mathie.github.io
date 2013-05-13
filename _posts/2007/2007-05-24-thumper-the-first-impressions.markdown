---
layout: post
status: publish
published: true
title: ! 'Thumper: The first impressions'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 425
wordpress_url: http://woss.name/2007/05/24/thumper-the-first-impressions/
date: 2007-05-24 18:56:23.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 820
  author: Matty
  author_email: matty91@gmail.com
  author_url: http://prefetch.net
  date: !binary |-
    MjAwNy0wNS0yNCAyMDoyNzo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNCAxOToyNzo0MiArMDEwMA==
  content: ! '<p>To patch your Solaris 10 host, I highly recommend using the opensource
    pca utility (smpatch is not the most reliable piece of software):</p>


    <p>http://www.par.univie.ac.at/solaris/pca/</p>


    <p>Pca has some nifty features, and is a piece of cake to use:</p>


    List available patches


    <p>$ pca -l</p>


    Install all reliability and security patches


    <p>$ pca -i missingrs</p>


    <ul>

    <li>Ryan</li>

    </ul>'
- id: 821
  author: Kisin
  author_email: jjm@ixtab.org.uk
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0yNCAyMTo0NToyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNCAyMDo0NToyNSArMDEwMA==
  content: <p>24TB's ! That's one hell of an amount of storage. The tray loading hard
    drives do look very nice.</p>
- id: 822
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNS0yNSAwOTowNzo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAwODowNzo1NyArMDEwMA==
  content: ! '<p>Matty: Yeah, I didn''t find smpatch to be particularly easy to use.  It
    took 4 runs, installing one patch manually and a couple of reboots before it claimed
    every patch was installed.  And since it didn''t shut down correctly during one
    of the reboots, I can only hope that it''s all installed correctly.  I''ll definitely
    check out <code>pca</code> in the future.</p>'
- id: 823
  author: Footsteps
  author_email: footsteps@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0yNSAxNToyMToyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNSAxNDoyMToyNCArMDEwMA==
  content: <p>Yes, smpatch is junk.  I hate to be so negative, but it's unreliable
    worthless junk.  At best.  Use pca or even the R&amp;S patch clusters.</p>
- id: 824
  author: Douglas F Shearer
  author_email: dougal.s@gmail.com
  author_url: http://douglasfshearer.com
  date: !binary |-
    MjAwNy0wNi0xMSAwMDo1MToxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMCAyMzo1MToxMiArMDEwMA==
  content: ! '<p>Oooh, shiny! Popped by here randomly to see what was up, surprised
    to see you have a Thumper and Solaris, mostly as I''m building a mini-thumper
    (IBM Intel Box with multiple drives) using OpenSolaris.</p>


    <p>Maybe Sun have turned their brain-wave satellite on the Edinburgh area....targeted
    especially at Rails Developers.</p>'
---
In note form:

* Man, this thing is **noisy**!  Then again, with 8 big fans at the front, 48 spindles, two power supply fans & doubtless countless other moving parts, I shouldn't be surprised.  Still, I'm now sitting in the living room with the office door closed and the noise is bearable.

* The Solaris console (that which asks you the usual `sysidconfig` questions) is not attached to the monitor & keyboard.  It's attached to the serial console, which in turn is attached to the ILOM.  So you really *need* to get the ILOM up and running first, instead of just digging an old monitor & USB keyboard out of the cupboard.  It's the way to go anyway, I was just being lazy because it was easier than digging out an old laptop with a real, live serial port on it.

* The ILOM comes preconfigured to pick up an IP address through DHCP, so you don't actually need to do the serial cable jig.  You just need to figure out what IP address it picked (something your DHCP server should be able to tell you, since you know the MAC address).  So all you need to do is plug the ILOM network port (which is on the VGA PCI card) into your network and apply power.  Then figure out the IP address and do `ssh root@192.168.0.8` (which was the IP mine happened to pick), and log in with a password of 'changeme'.

* The ILOM also has a neat web interface for the command line challenged.  Looks useful for getting component status before I learn how to use `cfgadm` et al.

* The machine comes preconfigured with Solaris 10 U3.  The basic drive configuration is:

  * the first two disks are Solaris Volume Manager (`meta*`) mirrors of each other, with partitions for `/`, `/var` & swap.  From what I can tell, there is >400GB of unpartitioned space on the boot volumes for some bizarre reason.

  * The remainder of the disks are amalgamated, in 8 raidz1 chunks, into a single pool called `zpool1`.  Each chunk has 5 or 6 disks, one from each of the 6 SATA controllers.  That seems like a good pattern for redundancy, but I'll probably try and rebuild them as raidz2 at some point.

* Sun's online stuff (<http://docs.sun.com/>, [Sun Update Connection](http://sunconnection.sun.com/), [Online Support Centre](https://osc-emea.eu.sun.com/OSCSW/svcportal?pageName=OSCHomeSelfSolve) and [SunSolve](http://sunsolve.sun.com/) that I've found so far) are a maze of twisty passages all, well, crap.  I spent a while trying to figure out how to do software updates, eventually tracked down [Sun Connection](http://www.sun.com/service/sunconnection/gettingstarted.jsp).  But of course, the documentation refers mostly to the GUI and doesn't explain how `smpatch` works...

* It turns out that patching Solaris is a *lot* easier than I remember, and certainly easier than figuring out how: `smpatch update` appears to do most of the job, once you've registered the system.  There's some tweaking to be done afterwards because I see some patches are failing (requiring single user mode, or interactivity) but it's sorting the majority of them.  I shall read the man page while the rest are installing.

* Registering the system from the command line is pretty easy -- just create the appropriate properties file and run `sconadm register -a -r /path/to/file.properties`.  I'm having trouble figuring out whether I have a subscription key or not, though.  Does that happen automatically if you buy hardware from Sun, or only if you go with a super-duper support contract?  (Which I am planning to do anyway, but once it's closer to being deployed.)

* `svcadm disable` is your friend.  Man, what *are* all those services?

* The Thumper is a beautiful piece of engineering.  Everything can be removed and replaced, and it all makes a satisfying thunk when you put it back in.
