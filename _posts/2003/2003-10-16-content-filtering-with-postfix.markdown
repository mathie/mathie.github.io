---
layout: post
status: publish
published: true
title: Content filtering with Postfix
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 325
wordpress_url: http://woss.name/2003/10/16/content-filtering-with-postfix/
date: 2003-10-16 17:46:33.000000000 +01:00
categories:
- Geekery
tags:
- Geekery
comments: []
---
I'm not overly enthused about the way our mail filter machine works.  What appears to happen is that the Postfix SMTP server listens for connections from duh Interweb at large.  It does some very basic checks ("Are you trying to use me as an open relay?" basically), then accepts the mail, hook line and sinker.  It writes the mail to an incoming queue and responsibility passes onto the queue manager to do something with it.  The queue manager then passes it through the content filter (in our case, <a href="http:&#47;&#47;www.ijs.si&#47;software&#47;amavisd&#47;">amavisd-new<&#47;a>) which happens to talk SMTP.  If amavisd-new happens to think the message has a high enough score (ie "I have absolutely no doubt in my mind that this is spam") then it will <strong>reject it at the SMTP stage<&#47;strong>.  Postfix is then left with this message that it feels obliged to bounce.  Herein lies the problem.  I want to be able to pass the buck upstream (often to the spammers themselves, or at least their ISP) and reject spam at the initial SMTP stage.  This strikes me as much cleaner and stops my mail queue filling up with messages from MAILER-DAEMON to non-existant addresses.

Unfortunately, I don't believe Postfix can be configured to do this (if I'm wrong, feel free to leave a comment pointing me in the right direction!).

Now, when amavisd-new is passing mail (that it doesn't see the need to reject) onward to the SMTP server which will finally deliver the message, it waits until the onward SMTP server returns success before itself returning success and, conversely, if the onward SMTP server rejects the message, amavisd-new will pass on the rejection.  This is pretty much the behaviour I'm looking for.

So, why not have amavisd-new listen directly for SMTP connections from the outside world rather than sitting a (useless?) Postfix SMTP listener on the front?  Well, you lose out on the run through Postfix's cleanup daemon before the content filtering happens.  You'd need to do the hack I described earlier today (I wonder where I got the inspiration for this?) so that the running Postfix didn't trust connections from that nasty localhost machine and you'd lose detail from the logs.  You'd also be running an SMTP daemon open to the outside world which I suspect has less experience of hostile clients.  And you'd have to do some dance to continue having amavisd-new running as its own user but being able to bind to port 25.

Anything else I'm missing?  If not, I think it's worth trying out...  Of course, the other solution is silently drop mail which amavisd-new is convinced is spam, but the idea of ever silently dropping mail on a production mail server is utterly abhorrent.
