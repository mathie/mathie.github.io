---
layout: post
status: publish
published: true
title: Accessibility reports
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 20
wordpress_url: http://woss.name/?p=20
date: 2005-08-03 11:20:24.000000000 +01:00
categories:
- Geekery
- Meta
- Work
tags: []
comments: []
---
Anyway, the reason I got onto fiddling with language settings was to improve my conformance with the W3C <a href="http:&#47;&#47;www.w3.org&#47;TR&#47;WAI-WEBCONTENT&#47;" title="Web Content Accessibility Guidelines 1.0">accessibility standards<&#47;a>.  According to an automated report produced by <a href="http:&#47;&#47;www.contentquality.com&#47;mynewtester&#47;cynthia.exe" title="Cynthia Says - Web content accessibility report">Cynthia Says<&#47;a>, I conform to the priority 1 portion of the standard, but unfortunately not priorities 2 or 3.

I'm being let down by:

<ul>
  <li><strong>Priority 2, rule 13.1.2: All Anchor elements are required not to use the same link text to refer to different resources.<&#47;strong><br &#47;>
The Technorati tags I'm using have the tag name as the link text.  In the body of a post, however, I'm using the same link text to point to a different URL.  For example, in <a href="http:&#47;&#47;woss.name&#47;2005&#47;08&#47;01&#47;mailmanager-20-released&#47;" title="MailManager 2.0 released!">MailManager 2.0 released!<&#47;a> I'm referring to the phrase 'MailManager' as linking to <a href="http:&#47;&#47;sourceforge.net&#47;projects&#47;mailmanager" title="MailManager page on Sourceforge">http:&#47;&#47;sourceforge.net&#47;projects&#47;mailmanager<&#47;a>, but in the tags at the bottom it points to <a href="http:&#47;&#47;technorati.com&#47;tag&#47;mailmanager" title="Technorati tag for MailManager" rel="tag">http:&#47;&#47;technorati.com&#47;tag&#47;mailmanager<&#47;a>.  (And this post is really going to kill my conformance!)  I can't really think of a solution to this...<&#47;li>
  <li><strong>Priority 3, rule 10.5.1: All Anchor elements not surrounding images cannot be directly adjacent.<&#47;strong><br &#47;>
This, again, is partly to do with the Technorti tags, though there are other elements on the page to blame.  The checker dislikes the fact that there are multiple anchor tags (links) only separated by whitespace characters.  Actually, they're not, they've also got a comma between them, but it would appear that's not enough.  I can think of a solution, though.  It might be happier if I represented the tags as an unordered list, and fiddled with the CSS to display them in a similar manner to how they are now.<&#47;li>
<&#47;ul>

(This post is entirely work-related, BTW!  Part of the redesign for the UI of MailManager is to have it fully WAI-AA compliant, which means I need to hit at least all the priority 2 rules.  I'm just getting to grips with it using an Internet visible, predictable-content site.)
