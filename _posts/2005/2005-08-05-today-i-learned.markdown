---
layout: post
status: publish
published: true
title: Today I learned
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 28
wordpress_url: http://woss.name/?p=28
date: 2005-08-05 16:00:46.000000000 +01:00
categories:
- Geekery
- Python
tags: []
comments: []
---
... that XML namespaces are not actually valid in XHTML, even in <a href="http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml11&#47;" title="XHTML 1.1 - Module-based XHTML">XHTML 1.1<&#47;a>.  This comes as quite a surprise, since I thought that's how <a href="http:&#47;&#47;www.w3.org&#47;Math&#47;" title="W3C Math home">MathML<&#47;a> was built on top of it.  The reason for discovering this is that I'm working with Zope's <a href="http:&#47;&#47;www.plope.com&#47;Books&#47;2_7Edition&#47;ZPT.stx" title="Zope Page Templates">page templates<&#47;a> to revamp the user interface for <a href="http:&#47;&#47;mailmanager.sourceforge.net" title="Email response management system">MailManager<&#47;a>.  And working with the source templates, one of the steps I'm taking it to run them through <a href="http:&#47;&#47;www.cogsci.ed.ac.uk&#47;~richard&#47;rxp.html" title="Richard's (?) XML Parser">RXP<&#47;a> to verify they are correct and validate them.  So I'm starting off with page templates that are something like the following:

[code lang="xml"]<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-&#47;&#47;W3C&#47;&#47;DTD XHTML 1.0 Strict&#47;&#47;EN"
                      "http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;DTD&#47;xhtml1-strict.dtd">
<html xmlns="http:&#47;&#47;www.w3.org&#47;1999&#47;xhtml"
  xmlns:tal="http:&#47;&#47;xml.zope.org&#47;namespaces&#47;tal"
  xmlns:metal="http:&#47;&#47;xml.zope.org&#47;namespaces&#47;metal"
  xmlns:i18n="http:&#47;&#47;xml.zope.org&#47;namespaces&#47;i18n"
  i18n:domain="mailmanager">
  <head>
    <title tal:content="here&#47;title">Template Title<&#47;title>
  <&#47;head>
  <body>
    <h1 tal:content="here&#47;title">Template Title<&#47;h1>

    <p tal:content="structure here&#47;content">The main body of the template.<&#47;p>
  <&#47;body>
<&#47;html>[&#47;code]

(OK, that's a very contrived example!)  Now that is well formed XML and the parser tells me so.  Unfortunately, it doesn't <em>validate<&#47;em>, complaining about <code>Undeclared attribute xmlns:tal for element html<&#47;code> for each of the XML namespace declarations, then complaining about the namespace-constrained <code>tal:content<&#47;code> tags.  This is pesky, because it doesn't allow me to validate the HTML that's contained in the default namespace, whilst ignoring the namespace-related errors for namespaces that it doesn't recognise (which is how a browser SHOULD behave).

Reading the <a href="http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;" title="eXtensible HyperText Markup Language">XHTML 1.0<&#47;a> standard, this is correct.  Section <a href="http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;#well-formed" title="3.1.2. Using XHTML with other namespaces">3.1.2<&#47;a> states:

<blockquote>
<p>The XHTML namespace may be used with other XML namespaces as per [XMLNS], although such documents are not strictly conforming XHTML 1.0 documents as defined above. Work by W3C is addressing ways to specify conformance for documents involving multiple namespaces.<&#47;p>
<&#47;blockquote>

Great.  So, what I now need to do is find (or modify) a validator that has the option to ignore namespaces that are correctly declared and used, while accurately validating the rest of my page templates.  While not strictly conforming, it is definitely what I would consider most useful.  Alternatively, I could not bother to validate my page templates at source, and instead validate the resulting XHTML once they are processed.  This does need to be done anyway, but it isn't going to provide the full coverage of the templates without a lot of extra work -- it would be much saner to validate the original template files first.  Perhaps it wouldn't take that long to hack something together in Python...
