---
layout: post
status: publish
published: true
title: Irregular expressions
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 96
wordpress_url: http://woss.name/?p=96
date: 2005-09-02 11:04:56.000000000 +01:00
categories:
- Geekery
- Python
- Work
tags: []
comments: []
---
Looking through some sample data for <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a>, I came across the following:

[code]r.examplemended[&#47;code]

and thought "that's an odd typo."  Then it dawned on me.  Somebody has gone through the file with the following chunk of sed: <code>s&#47;.com&#47;.example&#47;g<&#47;code>, trying to replace email addresses with the <code>.com<&#47;code> domain, with <code>.example<&#47;code> equivalents.  Unfortunately, the '.' wasn't escaped, so was interpreted as meaning 'any single character', so 'ecom' was replaced by '.example'.  Oops. :-)

And now back to figuring out why it's telling me:

[code] ERROR: could not find tsearch config by locale[&#47;code]

...
