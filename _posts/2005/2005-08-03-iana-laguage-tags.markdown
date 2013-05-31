---
layout: post
title: IANA Language Tags
date: 2005-08-03 10:36:57 +01:00
categories:
- Geekery
- Web surfing
---
I was browsing the format of language tags defined by the <acronym title="Internet Assigned Numbers Association">IANA</acronym> to see exactly the incantation I should use in an HTML <code>lang</code> attribute to express that the section is written in British English.  It turns out to be defined in [RFC 3066](http://www.faqs.org/rfcs/rfc3066.html) and is, in ABNF:

{% highlight bash %}
Language-Tag = Primary-subtag *( "-" Subtag )

    Primary-subtag = 1*8ALPHA

    Subtag = 1*8(ALPHA / DIGIT)
{% endhighlight %}

So, for British English, should probably be 'en-GB', though that's not strictly defined by the IANA.  The way it's done, I would hope that all HTML parsers would still read the <code>Primary-subtag</code> and realise that it is some sort of dialect of English.

But that's not the wotsit of this post.  What I did discover is that one of the language codes registered is [en-scouse](http://www.iana.org/assignments/lang-tags/en-scouse)!  Yes, that's right, Scousers have their own language officially registered with the IANA.  So all you Liverpudlians can start tagging you HTML pages starting:

{% highlight xml %}
<html xmlns="http://www.w3.org/1999/xhtml"
      lang="en-scouse" xml:lang="en-scouse">
  ...
</html>
{% endhighlight %}

presumably so  that screen readers for blind people can automatically choose the appropriate accent!

OK, there's now the temptation to send in a registration for 'en-weegie'. :-)
