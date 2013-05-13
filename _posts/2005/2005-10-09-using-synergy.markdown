---
layout: post
status: publish
published: true
title: Using Synergy
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 142
wordpress_url: http://woss.name/?p=142
date: 2005-10-09 13:05:27.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 149
  author: Mike
  author_email: m.rovardi@blueyonder.co.uk
  author_url: http://www.livejournal.com/users/digitalwanderer/
  date: !binary |-
    MjAwNS0xMC0wOSAxOTozNDo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0wOSAxODozNDo0MiArMDEwMA==
  content: ! 'Ah, the irony... about half an hour ago I was sat reading a newspaper
    (darn old-fashioned technology, eh?  :)  ) when we had a power spike - I ran upstairs
    to find both PCs rebooting (actually, I needed to power one off and back on before
    it would boot again)...


    Alas, my trusty CRT monitor, a rather nice 17" ADI Trinitron screen I use as my
    secondary monitor when using Synergy, isn''t looking quite so peachy.  I''ve been
    using it for about 8 years now, and it seems to have suffered the power spike
    badly - it''s picked up a horrible "shadow" effect on vertical lines and seems
    to be suffering from occasional "tearing".  It has lost most of it''s settings
    (eg brightness, contrast, etc), and seems to have difficulty with centreing the
    desktop on the screen...


    I''ve tried numerous reboots, reinstalling graphics card drivers, testing it on
    my TFT (looks fine on there, even through the analogue port), and now a total
    power down for a few minutes to see if the magical computer fairies will fix it
    while my back is turned (don''t laugh, you''ve all tried it at some point in your
    computer-using careers... :)  )...


    Looks like another TFT might be in order...


    Mike'
---
<a href="http:&#47;&#47;woss.name&#47;synergydesksetup.jpg"><img src='http:&#47;&#47;woss.name&#47;wp-content&#47;thumb-synergydesksetup.jpg' alt='My desk at home, using Synergy' class="alignright" &#47;><&#47;a> Thanks to <a href="http:&#47;&#47;www.livejournal.com&#47;users&#47;digitalwanderer&#47;">Mike<&#47;a>'s comment <a href="http:&#47;&#47;woss.name&#47;2005&#47;10&#47;06&#47;testing-out-a-second-monitor&#47;">a couple of posts ago<&#47;a>, I have been trying out <a href="http:&#47;&#47;synergy2.sourceforge.net&#47;">Synergy<&#47;a> to share my mouse and keyboard between my laptop and desktop computers.  At first I was skeptical about how well it would work but, having now been using it for a couple of days, I'm converted.

One machine runs as the Synergy server, and that's the computer which is connected to the keyboard and mouse you wish to use.  It is supplied with a configuration file mentioning all the possible clients that might want to connect to it, along with their relative physical positions (for example, as you can see from the picture, I specify my laptop as being 'below' me desktop machine).

Now, when I run the synergy client on my laptop, I tell it the name of the synergy server, it connects to the daemon running on the desktop.  Now, when I push my mouse cursor off the bottom of the screen on my desktop machine, it magically switches focus to my laptop, and both the keyboard &amp; mouse control the laptop computer!  Neat!

For bonus points, it will even share the contents of the clipboard between computers.  So if I select something on my laptop (as I just did with the image tag above) and copy it to the clipboard, I can paste it straight in here (which I'm writing on the desktop machine).

There's occasionally a little bit of lagginess with typing (sometimes if I'm writing prose, for example, I'll notice it pause for a couple of seconds; it always catches up, though) but that's probably because I'm using a wireless network...

All in all, a fantastic piece of software.  Unfortunately, work twigged that it would be more cost-effective to buy me a new monitor than chown the iMac that's currently lying around... :)
