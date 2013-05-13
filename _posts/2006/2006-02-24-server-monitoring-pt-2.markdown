---
layout: post
title: Server monitoring, pt. 2
date: 2006-02-24 16:35:10 +00:00
categories:
- Geekery
---
Well, I've created myself a trial account with [Server Monitoring](http://www.server-monitoring.co.uk) and it seems to be working pretty well.  At least it just SMS'd me to tell me that a couple of my sites were unavailable -- sure enough, when I eventually managed to log into the host they are on (`napoleon.dreamhost.com`), yep, it had a load average of 135+.  And none of my sites were responding.  On the other hand, whoever caused that owes me 60p worth of text messages!

I've toned down the alerts slightly.  Now it will email me as soon as there's something awry, but it will only SMS me if things have been screwy for 15 minutes.  Which, if I'm not at the computer, already is not much in the way of extra lag time, really.  And it'll only SMS me for the **important** customer sites. :)

I'm still after another, cheaper, solution, since this will cost em &pound;50 per web host I want to monitor.  I guess it's possible that it will be cheaper to get a virtual host of some variety and run `mon` or `nagios` on it.  Still, in my experience, these systems have too many false positives or require too much time to maintain, so I'd rather get somebody else to do it well...
