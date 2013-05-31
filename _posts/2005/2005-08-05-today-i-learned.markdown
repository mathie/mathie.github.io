---
layout: post
title: Today I learned
date: 2005-08-05 16:00:46 +01:00
categories:
- Geekery
- Python
---
... that XML namespaces are not actually valid in XHTML, even in [XHTML 1.1](http://www.w3.org/TR/xhtml11/).  This comes as quite a surprise, since I thought that's how [MathML](http://www.w3.org/Math/) was built on top of it.  The reason for discovering this is that I'm working with Zope's [page templates](http://www.plope.com/Books/2_7Edition/ZPT.stx) to revamp the user interface for [MailManager](http://mailmanager.sourceforge.net).  And working with the source templates, one of the steps I'm taking it to run them through [RXP](http://www.cogsci.ed.ac.uk/~richard/rxp.html) to verify they are correct and validate them.  So I'm starting off with page templates that are something like the following:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tal="http://xml.zope.org/namespaces/tal"
  xmlns:metal="http://xml.zope.org/namespaces/metal"
  xmlns:i18n="http://xml.zope.org/namespaces/i18n"
  i18n:domain="mailmanager">
  <head>
    <title tal:content="here/title">Template Title</title>
  </head>
  <body>
    <h1 tal:content="here/title">Template Title</h1>

    <p tal:content="structure here/content">The main body of the template.</p>
  </body>
</html>
{% endhighlight %}

(OK, that's a very contrived example!)  Now that is well formed XML and the parser tells me so.  Unfortunately, it doesn't <em>validate</em>, complaining about <code>Undeclared attribute xmlns:tal for element html</code> for each of the XML namespace declarations, then complaining about the namespace-constrained <code>tal:content</code> tags.  This is pesky, because it doesn't allow me to validate the HTML that's contained in the default namespace, whilst ignoring the namespace-related errors for namespaces that it doesn't recognise (which is how a browser SHOULD behave).

Reading the [XHTML 1.0](http://www.w3.org/TR/xhtml1/) standard, this is correct.  Section [3.1.2](http://www.w3.org/TR/xhtml1/#well-formed) states:

<blockquote>
<p>The XHTML namespace may be used with other XML namespaces as per \[XMLNS\], although such documents are not strictly conforming XHTML 1.0 documents as defined above. Work by W3C is addressing ways to specify conformance for documents involving multiple namespaces.</p>
</blockquote>

Great.  So, what I now need to do is find (or modify) a validator that has the option to ignore namespaces that are correctly declared and used, while accurately validating the rest of my page templates.  While not strictly conforming, it is definitely what I would consider most useful.  Alternatively, I could not bother to validate my page templates at source, and instead validate the resulting XHTML once they are processed.  This does need to be done anyway, but it isn't going to provide the full coverage of the templates without a lot of extra work -- it would be much saner to validate the original template files first.  Perhaps it wouldn't take that long to hack something together in Python...
