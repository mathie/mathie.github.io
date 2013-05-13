---
layout: post
status: publish
published: true
title: Updating the path everywhere on Ubuntu 09.10
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 535
wordpress_url: http://wordpress.woss.name/?p=535
date: 2010-03-15 15:43:51.000000000 +00:00
categories:
- Uncategorized
tags: []
comments: []
---
[Ubuntu](http:&#47;&#47;www.ubuntu.com&#47;) is my Linux of choice. It has been for a long time. I've been a huge fan of [Debian](http:&#47;&#47;www.debian.org&#47;) since the late '90s -- I was a Debian Developer stuck in the NM queue for a few years -- but the release cycle was *way* too long for my tastes (which invariably meant I kept most of my systems running testing or unstable). So I switched to Ubuntu pretty early on.

I'm also a Ruby developer and, in particular, keep [Ruby Enterprise Edition](http:&#47;&#47;www.rubyenterpriseedition.com&#47;) fed and cared for on my production servers. Every time I do a fresh install I have to remind myself how to make sure REE is **always** in the path and definitely in the path ahead of an accidental install of the stock Ruby on Ubuntu.

Here's the list of things I've had to change this morning on Ubuntu 09.10 to make sure `$PATH` is set correctly everywhere:

* `&#47;etc&#47;environment`, updating the `PATH="..."` line to read:

  `PATH="&#47;opt&#47;ruby-enterprise&#47;bin:&#47;usr&#47;local&#47;sbin:&#47;usr&#47;local&#47;bin:&#47;usr&#47;sbin:&#47;usr&#47;bin:&#47;sbin:&#47;bin:&#47;usr&#47;games"`

* `&#47;etc&#47;crontab`, updating its `PATH="..."` line to read:

  `PATH=&#47;opt&#47;ruby-enterprise&#47;bin:&#47;usr&#47;local&#47;sbin:&#47;usr&#47;local&#47;bin:&#47;sbin:&#47;bin:&#47;usr&#47;sbin:&#47;usr&#47;bin`

* `&#47;etc&#47;login.defs`, updating the `ENV_SUPATH` and `ENV_PATH` lines to read:

  `ENV_SUPATH	PATH=&#47;opt&#47;ruby-enterprise&#47;bin:&#47;usr&#47;local&#47;sbin:&#47;usr&#47;local&#47;bin:&#47;usr&#47;sbin:&#47;usr&#47;bin:&#47;sbin:&#47;bin`
  `ENV_PATH	PATH=&#47;opt&#47;ruby-enterprise&#47;bin:&#47;usr&#47;local&#47;bin:&#47;usr&#47;bin:&#47;bin:&#47;usr&#47;local&#47;games:&#47;usr&#47;games`

* `&#47;etc&#47;sudoers`, where I've had to add the following line to override the compiled-in default:

  `Defaults        secure_path = "&#47;opt&#47;ruby-enterprise&#47;bin:&#47;usr&#47;local&#47;sbin:&#47;usr&#47;local&#47;bin:&#47;usr&#47;sbin:&#47;usr&#47;bin:&#47;sbin:&#47;bin:&#47;usr&#47;X11R6&#47;bin"`

That seems to have covered everything. The incantation for sudo was a bit of a bother to find (it being a built in default rather than configured in `&#47;etc`), but with it, `sudo irb` now works, when it didn't before. I haven't changed the paths specified in init scripts as it seemed unnecessary.

For reference, the command I user to determine what might need changed was:

    sudo find &#47;etc -type f | xargs sudo grep 'PATH=' | grep -v &#47;opt&#47;ruby-enterprise

It produced a number of false positives, but was a good bet for figuring out the right ones.

So, have I missed anything? Have I changed things I shouldn't have changed?

(And yes, I know, I should be using some sort of Configuration Management system to bootstrap everything I touch...)
