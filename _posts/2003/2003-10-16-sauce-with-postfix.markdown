---
layout: post
status: publish
published: true
title: Sauce with Postfix
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 327
wordpress_url: http://woss.name/2003/10/16/sauce-with-postfix/
date: 2003-10-16 08:09:58.000000000 +01:00
categories:
- Geekery
tags:
- Geekery
comments: []
---
I spent a little time yesterday morning trying to configure <a href="http:&#47;&#47;www.chiark.greenend.org.uk&#47;~ian&#47;sauce&#47;">SAUCE<&#47;a> on this machine to handle some of my domains, alleviating some of the load for the <em>vast<&#47;em> volume of spam and mail to non-existant mailboxes.  SAUCE is designed to work with <a href="http:&#47;&#47;www.exim.org&#47;">Exim<&#47;a> and, while I gather it is a rather shiny MTA, I'm perfectly happy with <a href="http:&#47;&#47;www.postfix.org&#47;">Postfix<&#47;a> and have no great desire to change.

It would appear that the Exim version of &#47;usr&#47;lib&#47;sendmail takes additional options which allow you to emulate an SMTP connection from a remote host (the connection appears in the logs as appearing from the remote host and Exim will base its security checks on that information rather than the fact that it has actually turned up from SAUCE running on localhost).  So, replacing this with another MTA which does not have this extension is not going to work.  SAUCE delegates its relay checking to the real MTA.  If the real MTA thinks the connection is coming from localhost, you're creating an (albeit very unfriendly) open relay.  I had started by thinking that the config statement <code>local_domain<&#47;code> was the list of domains that it should accept mail for but as far as I can tell, that is only used to determine if an address pattern is local.  I'm having more than a little difficulty reading <a href="http:&#47;&#47;www.tcl.tk&#47;">TCL<&#47;a> and the commentary on the code is not overly verbose, so I could be completely wrong.

The solution?  I haven't figured that out yet.  Perhaps the ideal thing would be to modify Postfix to support the same options as Exim's sendmail driver, but I suspect that Postfix's architecture is going to get in the way there.  I suspect that SAUCE's rcpt-policy engine can be used to restrict what it accepts mail for.  Ideally, I'd like to say "accept mail for this list of addresses (though still doing your stringent checking); be as bastardly as you like while you drop the rest".   guess I'm going to have to try and understand TCL a little better.
