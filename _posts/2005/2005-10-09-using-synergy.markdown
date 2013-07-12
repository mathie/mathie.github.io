---
layout: post
title: Using Synergy
date: 2005-10-09 13:05:27 +01:00
categories:
- Geekery
---
<p><a href="http://woss.name/synergydesksetup.jpg"><img src='http://woss.name/wp-content/thumb-synergydesksetup.jpg' alt='My desk at home, using Synergy' class="alignright" /></a> Thanks to [Mike](http://www.livejournal.com/users/digitalwanderer/)'s comment [a couple of posts ago](http://woss.name/2005/10/06/testing-out-a-second-monitor/), I have been trying out [Synergy](http://synergy2.sourceforge.net/) to share my mouse and keyboard between my laptop and desktop computers.  At first I was skeptical about how well it would work but, having now been using it for a couple of days, I'm converted.</p>

One machine runs as the Synergy server, and that's the computer which is connected to the keyboard and mouse you wish to use.  It is supplied with a configuration file mentioning all the possible clients that might want to connect to it, along with their relative physical positions (for example, as you can see from the picture, I specify my laptop as being 'below' me desktop machine).

Now, when I run the synergy client on my laptop, I tell it the name of the synergy server, it connects to the daemon running on the desktop.  Now, when I push my mouse cursor off the bottom of the screen on my desktop machine, it magically switches focus to my laptop, and both the keyboard &amp; mouse control the laptop computer!  Neat!

For bonus points, it will even share the contents of the clipboard between computers.  So if I select something on my laptop (as I just did with the image tag above) and copy it to the clipboard, I can paste it straight in here (which I'm writing on the desktop machine).

There's occasionally a little bit of lagginess with typing (sometimes if I'm writing prose, for example, I'll notice it pause for a couple of seconds; it always catches up, though) but that's probably because I'm using a wireless network...

All in all, a fantastic piece of software.  Unfortunately, work twigged that it would be more cost-effective to buy me a new monitor than chown the iMac that's currently lying around... :)
