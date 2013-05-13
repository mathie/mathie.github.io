---
layout: post
status: publish
published: true
title: Vagrant box for Ubuntu 10.10 Maverick (64 bit)
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 587
wordpress_url: http://woss.name/?p=587
date: 2011-02-24 07:32:59.000000000 +00:00
categories:
- Geekery
- Mac OS X
- Software Configuration Management
- Work
tags: []
comments: []
---
I didn't really intend this to turn into a series, but hey ho. I needed to build a 64-bit [Ubuntu 10.10](https://help.ubuntu.com/community/Server/TechSpecs/1010) vagrant image for a client project I'm working on. (I still need to get around to he RHEL-a-like image, I'll get there one day!)

So, without further ado, here we are: [Vagrant Base Box for Ubuntu 10.10 "Maverick" (64-bit)](http://mathie-vagrant-boxes.s3.amazonaws.com/maverick64.box). Getting started with it is pretty simple. First of all, make sure you've got [VirtualBox 4.0.4](http://virtualbox.org/) or greater installed, along with Vagrant 0.7.0 or greater. Then all you need to do is:

<pre lang="bash">
vagrant box add maverick64 http://mathie-vagrant-boxes.s3.amazonaws.com/maverick64.box
</pre>

This will take a while to download the box and unpack it in the way that Vagrant likes to do. Finally, let's just test it out:

<pre lang="bash">
mkdir maverick_demo
cd maverick_demo
vagrant init maverick64
vagrant up
vagrant ssh
</pre>

which should wind up with you ssh'd into a pristine minimal Ubuntu 10.10 environment.

## Changelog

As I update the box, I'll update the change log here, newest changes at the top.

### 24th February, 2011

* Initial release.
* I've also updated the [Debian 6.0 "Squeeze"](http://woss.name/2011/02/07/vagrant-base-bo-for-debian-squeeze/) base box a little.
