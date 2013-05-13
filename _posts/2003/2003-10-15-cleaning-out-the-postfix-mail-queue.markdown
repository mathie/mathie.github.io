---
layout: post
title: Cleaning out the (Postfix) mail queue
date: 2003-10-15 13:04:18 +01:00
categories:
- Geekery
tags:
- Geekery
---
<p>Due to our mail architecture, the main filter machine will wind up with a lot of messages from MAILER-DAEMON sitting in its queue which remote hosts are refusing to accept.  Here is the command I use to clear out these messages:</p>

<pre>mailq|awk ' /^[0-9A-F][0-9A-F]*[^*].*MAILER-DAEMON$/ {print $1}'|sudo xargs -rn1 postsuper -d</pre>

<p>It's entirely specific to Postfix, of course.  Note the <code>[^*]</code> there which will skip messages from MAILER-DAEMON that it's currently in the process of trying to deliver.  I thought I'd share it with you because otherwise one of these days it's going to fall out of my <code>~/.bash_history</code> and I'll have to figure it out again...</p>
