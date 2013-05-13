---
layout: post
title: Outgoing Mail Grumps
date: 2006-07-17 14:36:55 +01:00
categories:
- Work
tags:
- Work
comments:
- id: 563
  author: Kisin
  author_email: jjm@ixtab.org.uk
  author_url: ''
  date: !binary |-
    MjAwNi0wNy0yMSAxNjozMTowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0yMSAxNTozMTowMyArMDEwMA==
  content: <p>How about looking at MessageLabs for your email ? They will clean it
    of most spam and all virus's, you may need to run your own SMTP server that they
    can reach tho. We've been using them at work for a while and it's been really
    good on the lack of spam stuff.</p>
- id: 564
  author: Switching to Gmail from DreamHost at Notes from a messy desk
  author_email: ''
  author_url: http://woss.name/2006/10/19/switching-to-gmail-from-dreamhost/
  date: !binary |-
    MjAwNi0xMC0xOSAxMzozMToxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xOSAxMjozMToxOSArMDEwMA==
  content: <p>[...] I&#8217;m still having outgoing messages bounced because they
    are regularly listed in Spamcop. See the linked post for a more balanced discussion
    of that, but it still doesn&#8217;t help me communicate with the people who&#8217;s
    ISP uses Spamcop! [...]</p>
---
*sigh* From the [SpamCop listing of mailbigip.dreamhost.com](http://www.spamcop.net/w3m?action=blcheck&ip=208.97.132.5):

> 208.97.132.5 listed in bl.spamcop.net (127.0.0.2)

> If there are no reports of ongoing objectionable email from this system it will be delisted automatically in approximately 15 hours.

> [ ... ]

> #### Listing History

> In the past 51.2 days, it has been listed 10 times for a total of 7.2 days

That appears to be the outgoing mail host for [DH](http://www.dreamhost.com/r.cgi?wossname) if I use SMTP AUTH.  Which I do, because I regularly connect from my laptop using different ISPs, so it's the most flexible solution.  And, unfortunately, a few customers I communicate with are stuck with [an ISP](http://www.lumison.net/) that outright rejects any mail from a host listed in SpamCop.  I'm not in the Mail Hosting/ISP world much these days, but I thought that sort of thing had gone out of fashion?

Still, it does mean that, in the last 51 days, I've had less than 86% availablility of email for communicating with them.  That kinda really sucks.  I'm off to go grump at both ISPs because they're both doing something dumb.
