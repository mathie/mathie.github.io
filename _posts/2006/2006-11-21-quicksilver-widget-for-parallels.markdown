---
layout: post
status: publish
published: true
title: Quicksilver widget for Parallels
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 356
wordpress_url: http://woss.name/2006/11/21/quicksilver-widget-for-parallels/
date: 2006-11-21 17:17:04.000000000 +00:00
categories:
- Geekery
tags:
- Geekery
comments: []
---
<img class="alignright" src="/dist/custom-file-and-folder-scanner.png" alt="screenshot of the custom file and folder scanner" /> I bought a copy of [Parallels](http://www.parallels.com/en/products/workstation/mac/) a couple of weeks back, along with my shiny new Macbook Pro laptop.  And since I'm a [Quicksilver](http://quicksilver.blacktree.com/) junkie, I've created a quick hack to allow me to launch particular VMs from within there.  To recreate the goodness for yourself, go to the custom catalogue in the Quicksilver preferences.  Add a new 'File & Folder Scanner' and select the source path as `~/Library/Parallels`.  Set 'Include Contents' to 'Folder Contents', the depth to '2' and the types to '.pvs'.  Click 'Omit source item'.  Finally, hit the refresh button and switch to the contents tab to verify that it's found all your virtual machines.

Now when you hit your QS trigger, you can start typing in the name of your virtual machine and then 'Run' it.

Now for a lazyweb request.  Can it be done properly?  So that there are actions associated with the virtual machines (run, pause, reset, stop maybe?)?
