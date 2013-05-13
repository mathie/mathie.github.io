---
layout: post
status: publish
published: true
title: ! 'Thumper: Creating and destroying zones'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 429
wordpress_url: http://woss.name/2007/05/27/thumper-creating-and-destroying-zones/
date: 2007-05-27 20:26:40.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 835
  author: Dick Davies
  author_email: rasputnik@gmail.com
  author_url: http://number9.hellooperator.net
  date: !binary |-
    MjAwNy0wNS0yNyAyMjowNzozNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yNyAyMTowNzozNCArMDEwMA==
  content: ! '<p>If your zones are similar you might want to look at using the zone
    clone feature - it''ll speed up building zones enormously (especially on  ZFS).<&#47;p>


    <p>See:<&#47;p>


    <p><a href="http:&#47;&#47;number9.hellooperator.net&#47;articles&#47;2007&#47;04&#47;09&#47;zones-clones-and-lazybones"
    rel="nofollow">http:&#47;&#47;number9.hellooperator.net&#47;articles&#47;2007&#47;04&#47;09&#47;zones-clones-and-lazybones<&#47;a><&#47;p>


    <p>I''ve got 2 Try n Buy Thumpers turning up next week, so I''m following your
    posts with interest :)<&#47;p>'
- id: 836
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNi0wNCAxODowOToyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAxNzowOToyMyArMDEwMA==
  content: ! '<p>Dick: Thanks for pointing that out.  Yeah, it currently takes a few
    minutes to create a new zone, so cloning an existing one will be much faster.  I
    still need to script the creation of that first zone, though, because they feel
    kinda transient...  I guess they won''t feel that way when I''ve got production
    apps sitting inside them!<&#47;p>'
- id: 837
  author: Joe Moore
  author_email: jmoore@ugs.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0wNyAyMjowNDoyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNyAyMTowNDoyNSArMDEwMA==
  content: ! '<p>You might also want to check out the zonemgr project on opensolaris.<&#47;p>


    <p>http:&#47;&#47;www.opensolaris.org&#47;os&#47;project&#47;zonemgr&#47;<&#47;p>


    <p>Command-line tool with options to configure most everything you want to set
    up in a zone (including blastwave''s pkg-get)<&#47;p>


    <p>--Joe<&#47;p>'
- id: 838
  author: mossy
  author_email: stevemoss@hotmail.com
  author_url: http://none
  date: !binary |-
    MjAwNy0wNi0xMiAwMTowOTowOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMiAwMDowOTowOCArMDEwMA==
  content: ! '<p>DNS lookup failing: I had this problem too but figured it out.

    name_service=NONE<&#47;p>


    <p>Then have your script add the &#47;etc&#47;resolv.conf, &#47;etc&#47;hosts

    next:

    mv &#47;your&#47;zone&#47;root&#47;etc&#47;nsswitch.dns &#47;your&#47;zone&#47;root&#47;etc&#47;nsswitch.conf<&#47;p>



    Your done.


    <p>)<&#47;p>




    <p>mossy<&#47;p>'
- id: 839
  author: mossy
  author_email: stevemoss@hotmail.com
  author_url: http://none
  date: !binary |-
    MjAwNy0wNi0xMiAwMjoxNDowNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMiAwMToxNDowNSArMDEwMA==
  content: ! '<p>Also I use this line to harden the zone:<&#47;p>


    <p>zlogin $1 "netservices limited"<&#47;p>


    <p>mossy<&#47;p>'
- id: 840
  author: Paul Armstrong
  author_email: psarmstr@gmail.com
  author_url: http://gometric.us
  date: !binary |-
    MjAwNy0wNi0xNiAwODo1MzoxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xNiAwNzo1MzoxMCArMDEwMA==
  content: ! '<p>Given you like ruby and you''re looking for a cfengine replacement,
    have you looked at puppet?<&#47;p>


    <p>http:&#47;&#47;puppet.reductivelabs.com&#47;<&#47;p>'
---
Today's experimenting has been with Solaris Zones.  Now that I'm starting to work with applications, I'd like to create individual application containers to house them.  So getting zones set up the way I want them has become a need.

(Actually, I started out today to create a zone for setting up a little bit of a monitoring system -- probably [Cricket](http:&#47;&#47;cricket.sourceforge.net&#47;) -- to watch temperatures and fan speeds of all the components in the system.  But I wound up spending longer than I anticipated figuring out the zone part, then I decided to just leave it at automating the process of creating and destroying zones in the way I like them.)

Anyway.  First of all, my zone root file systems are all stored in the main ZFS pool, `zpool1`.  Each zone also has a dataset delegated to it, so that it has a place to manage its own ZFS filesystems too.  Lets create root filesystems for both of those:

    zfs create zpool1&#47;zoneroots
    zfs create zpool1&#47;zones

That's about all the pre-configuration required.  Now let's bring up a zone.  Let's call the new zone 'monitoring', since that's what I was trying to bring up in the first place.  Later on, we'll give it the IP address 192.168.0.207.  We want to create the appropriate file systems in ZFS, ready for it, and let's give them a small quota so that the admin of the monitoring server can't go and steal all our disk space in the world ever:

    zfs create zpool1&#47;zoneroots&#47;monitoring
    zfs create zpool2&#47;zones&#47;monitoring
    zfs set quota=2g zpool1&#47;zoneroots&#47;monitoring
    zfs set quota=2g zpool1&#47;zones&#47;monitoring

So the root file system gets 2GB and this zone gets its own ZFS 'pool' also at 2GB.  Before we go any further, let's let less permissive permissions on those directories, otherwise `zoneadm install` will complain later on:

    chmod -R go-rwx &#47;zpool1&#47;zone{root,}s&#47;monitoring

Now let's create the configuration for the zone.  What we're doing here is taking the default configuration template (which inherits most of the useful inheritable directories, like `&#47;usr`), noting where the zone is stored, what ZFS data sets it gets, what additional directories it inherits (gets mounted read-only) from the global zone and what it's network configuration is.  If you're playing along at home, you'll probably want to tweak the IP address.

    zonecfg -z monitoring <<eof
      create
      set autoboot=true
      set zonepath=&#47;zpool1&#47;zoneroots&#47;monitoring
      add inherit-pkg-dir
        set dir=&#47;opt
      end
      add dataset
        set name=zpool1&#47;zones&#47;monitoring
      end
      add net
        set address=192.168.0.207&#47;24
        set physical=e1000g0
      end
      verify
      commit
    EOF

Sorted.  The `<<eof` notation is a shotcut to avoid all the prompts that I'd otherwise have to reproduce here.  You can elide that and enter the configuration interactively if you like.  Now you've got the configuration set up, let's do the initial installation:

    zoneadm -z monitoring install

This will take a few minutes (in fact it's the longest part of the entire process -- I had enough time to nip to the loo and go grab a nice cold beer from the fridge!) while it copies across some files and initialises all the packages you have installed.  If you did a full install and have Blastwave kicking around too, that's getting on for 1,700 packages.  Once it finishes, we're almost ready to boot.  But we don't want to have to waste time answering all those `sysidtool` questions, do we?  So, let's create `&#47;zpool1&#47;zoneroots&#47;monitoring&#47;root&#47;etc&#47;sysidcfg` to answer those questions for us:

    name_service=DNS
    {
      domain_name=rubaidh.com
      name_server=158.152.1.58,158.152.1.43
    }

    network_interface=PRIMARY
    {
      hostname=monitoring
      ip_address=192.168.0.207
      netmask=255.255.255.0
      protocol_ipv6=no
      default_route=192.168.0.1
    }

    root_password=encryptedrootpassword

    security_policy=NONE
    service_profile=limited_net
    system_locale=en_GB.UTF-8
    terminal=xterms
    timezone=GB
    timeserver=localhost

Obviously you'll have to tweak this one to your preferences.  Next up we want to touch a file so that it stops asking us if we want an NFSv4 domain that's different from the default.  It would appear that, in more recent OpenSolaris releases, you can get this by setting `nfs4_domain=dynamic` in the `sysidcfg` file instead, but that didn't work for me on Solaris 10 U3.  Instead, I created an empty file:

    touch &#47;zpool1&#47;zoneroots&#47;monitoring&#47;root&#47;etc&#47;.NFS4inst_state.domain

which seemed to shut it up.  (I don't care, I'm not using NFS.  YMMV.)  Finally, we get the chance to boot and log into the new zone:

    zoneadm -z monitoring boot
    zlogin -C monitoring

It'll take a while to import all the SMF descriptions (117 of them in my case).  And, if you're like me, it'll then moan that it can't verify the name service information (because it can't look up its own name) and would you like to enter new name service information?  No, thanks very much, I wouldn't.  I guess this one is a temporary setback on my systems because I'm sitting on a home LAN with no local DNS to speak of, but it would be nice to be able to disable the warning.

Anyhow, whether it asks you or not, it'll note that important things have changed and that it must automatically reboot the zone.  It reboots remarkably quickly, and you're left with a console login.  Yay!  We have a zone!  You can now log in as root, with the password you supplied earlier (you did update the encrypted password in your `sysidcfg`, right?).

That sounds like a lot of automatable hard work, doesn't it?  Well, that's what I thought too, so I created a shell script which takes a zone name and ip address as arguments.  It promotes convention over configuration, using the sensible (?) defaults I've figured out for myself, while picking some of the other default values automatically from the host system.  You can grab the shell script I created as [create_zone.sh](http:&#47;&#47;woss.name&#47;dist&#47;create_zone.sh), and there's a matching [delete_zone.sh](http:&#47;&#47;woss.name&#47;dist&#47;delete_zone.sh) which will destroy and clean up everything that was created.  You might want to be very careful with that one though!

Let me know how the scripts work for you, because I'm sure they could do with some improvement. :-)

Things I'd still like to fix with the create script:

* As far as I can tell, setting `service_profile=limited_net` does nothing useful (though changing it to `service_profile=limited` caused a parse error, so it *is* interpreting what I put int there!), so I'd like to have an automated way to disable all the useless services that Solaris starts by default.

* I'd like it not to warn about errant name service configurations and not offer to reconfigure.

Still, it's a good enough base for me to keep for integrating with my planned super-duper [capistrano](http:&#47;&#47;www.capify.org&#47;) deployment system which will manage this entire system for me. :-)  (I'm convinced that Capistrano needs only a few minor enhancements to make it a complete cfengine replacement, so that's approximately what I'm plotting doing with it.)
