---
layout: post
status: publish
published: true
title: Cleaning out the (Postfix) mail queue
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 328
wordpress_url: http://woss.name/2003/10/15/cleaning-out-the-postfix-mail-queue/
date: 2003-10-15 13:04:18.000000000 +01:00
categories:
- Geekery
tags:
- Geekery
comments:
- id: 2
  author: Mike
  author_email: method@method.cx
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wMSAwNToyNzoxNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wMSAwNDoyNzoxNiArMDAwMA==
  content: ! '<p>I do something similar with a shell script, not a neat 1 liner like
    you.  I''m trying to fix a friend''s mail server that has over 141k messages in
    the queue right now.  It takes almost an hour just to parse the mailq output.  I
    wish there were a faster way to do this.<&#47;p>


    <p>-M<&#47;p>'
- id: 3
  author: Mark Hogben
  author_email: mhogben@mmpandora.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0yNSAyMDoyNjo1NSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yNSAxOToyNjo1NSArMDEwMA==
  content: ! '<p>A spambot utilizing a clients email is clogging my ques.<&#47;p>


    <p>Thanks for taking the time to post this solution<&#47;p>


    <p>it worked great<&#47;p>'
---
<p>Due to our mail architecture, the main filter machine will wind up with a lot of messages from MAILER-DAEMON sitting in its queue which remote hosts are refusing to accept.  Here is the command I use to clear out these messages:<&#47;p>

<pre>mailq|awk ' &#47;^[0-9A-F][0-9A-F]*[^*].*MAILER-DAEMON$&#47; {print $1}'|sudo xargs -rn1 postsuper -d<&#47;pre>

<p>It's entirely specific to Postfix, of course.  Note the <code>[^*]<&#47;code> there which will skip messages from MAILER-DAEMON that it's currently in the process of trying to deliver.  I thought I'd share it with you because otherwise one of these days it's going to fall out of my <code>~&#47;.bash_history<&#47;code> and I'll have to figure it out again...<&#47;p>
