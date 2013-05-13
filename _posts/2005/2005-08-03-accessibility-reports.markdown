---
layout: post
status: publish
published: true
title: Accessibility reports
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-08-03 11:20:24.000000000 +01:00
categories:
- Geekery
- Meta
- Work
tags: []
comments: []
---
Anyway, the reason I got onto fiddling with language settings was to improve my conformance with the W3C <a href="http://www.w3.org/TR/WAI-WEBCONTENT/" title="Web Content Accessibility Guidelines 1.0">accessibility standards</a>.  According to an automated report produced by <a href="http://www.contentquality.com/mynewtester/cynthia.exe" title="Cynthia Says - Web content accessibility report">Cynthia Says</a>, I conform to the priority 1 portion of the standard, but unfortunately not priorities 2 or 3.

I'm being let down by:

<ul>
  <li><strong>Priority 2, rule 13.1.2: All Anchor elements are required not to use the same link text to refer to different resources.</strong><br />
The Technorati tags I'm using have the tag name as the link text.  In the body of a post, however, I'm using the same link text to point to a different URL.  For example, in <a href="http://woss.name/2005/08/01/mailmanager-20-released/" title="MailManager 2.0 released!">MailManager 2.0 released!</a> I'm referring to the phrase 'MailManager' as linking to <a href="http://sourceforge.net/projects/mailmanager" title="MailManager page on Sourceforge">http://sourceforge.net/projects/mailmanager</a>, but in the tags at the bottom it points to <a href="http://technorati.com/tag/mailmanager" title="Technorati tag for MailManager" rel="tag">http://technorati.com/tag/mailmanager</a>.  (And this post is really going to kill my conformance!)  I can't really think of a solution to this...</li>
  <li><strong>Priority 3, rule 10.5.1: All Anchor elements not surrounding images cannot be directly adjacent.</strong><br />
This, again, is partly to do with the Technorti tags, though there are other elements on the page to blame.  The checker dislikes the fact that there are multiple anchor tags (links) only separated by whitespace characters.  Actually, they're not, they've also got a comma between them, but it would appear that's not enough.  I can think of a solution, though.  It might be happier if I represented the tags as an unordered list, and fiddled with the CSS to display them in a similar manner to how they are now.</li>
</ul>

(This post is entirely work-related, BTW!  Part of the redesign for the UI of MailManager is to have it fully WAI-AA compliant, which means I need to hit at least all the priority 2 rules.  I'm just getting to grips with it using an Internet visible, predictable-content site.)
