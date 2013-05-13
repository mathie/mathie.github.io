---
layout: post
status: publish
published: true
title: Vagrant base box for Debian Squeeze
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
excerpt: I've built a Vagrant base box for the newly released Debian 6.0 "Squeeze"
  which went live over the weekend. I figured I'd share it to save you the bother
  of building one too.
wordpress_id: 581
wordpress_url: http://woss.name/?p=581
date: 2011-02-07 10:57:36.000000000 +00:00
categories:
- Geekery
- Software Configuration Management
tags:
- virtualbox
- vagrant
- debian
- squeeze
- virtualisation
- linux
comments:
- id: 1091
  author: Michael
  author_email: mbravo@acm.org
  author_url: ''
  date: !binary |-
    MjAxMS0wMi0yNSAyMjowMzo1OCArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0yNSAyMjowMzo1OCArMDAwMA==
  content: ! '<p>not sure if you''re aware - link to S3 location of the box currently
    returns Permission Denied<&#47;p>

'
- id: 1092
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAxMS0wMi0yNiAxMjozNzo1MyArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0yNiAxMjozNzo1MyArMDAwMA==
  content: ! '<p>Michael: Oops, sorry, I must have failed to update the permissions
    when I uploaded the latest version. Fixed now. Thanks for letting me know!<&#47;p>

'
---
To celebrate the [new release of Debian Squeeze](http:&#47;&#47;www.debian.org&#47;News&#47;2011&#47;20110205a) at the weekend, I decided to have a quick hack around with setting up a [Vagrant](http:&#47;&#47;www.vagrantup.com&#47;) base box for it. What I really want to do is build and share a base box for something not entirely unlike RedHat Enterprise Linux 5, which is what our production platform at work uses, but I wanted to get a feel for packaging up base boxes, so I started with something I'm more familiar with.

Anyway, turns out it's really not that hard. The [instructions for creating base boxes](http:&#47;&#47;vagrantup.com&#47;docs&#47;base_boxes.html) are pretty comprehensive. So, without further ado, here we are: [Vagrant Base Box for Debian 6.0 "Squeeze" (32-bit)](http:&#47;&#47;mathie-vagrant-boxes.s3.amazonaws.com&#47;debian_squeeze_32.box). Getting started with it is pretty simple. First of all, make sure you've got [VirtualBox 4.0](http:&#47;&#47;virtualbox.org&#47;) installed, along with Vagrant 0.7.0 or greater. Then all you need to do is:

    vagrant box add debian_squeeze_32 \
    http:&#47;&#47;mathie-vagrant-boxes.s3.amazonaws.com&#47;debian_squeeze_32.box

(excuse the formatting, I will fix the code examples on this site one day!) This will take a while to download the box and unpack it in the way that Vagrant likes to do. Finally, let's just test it out:

    mkdir squeeze_demo
    cd squeeze_demo
    vagrant init debian_squeeze_32
    vagrant up
    vagrant ssh

which should wind up with you ssh'd into a pristine minimal Debian Squeeze environment, ready to test out its stable goodness.

## Changelog

As I update the box, I'll update the change log here, newest changes at the top.

### 26th February, 2011

* Updated the permissions on S3 so you can actually download the new version. Sorry, folks!

### 24th February, 2011

* `apt-get update && apt-get upgrade` to pull in the latest package updates.
* Upgraded the VirtualBox Guest Additions from 4.0.2 to 4.0.4.
* Remove the USB controller, since it's unnecessary.
* Dropped the Grub timeout from 5 seconds to 1, since Vagrant ain't allowing you to choose an alternative anyway.

### 7th February, 2011

* Initial release.
