---
layout: post
status: publish
published: true
title: Zope Page Template weirdness
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 148
wordpress_url: http://woss.name/?p=148
date: 2005-10-14 15:20:59.000000000 +01:00
categories:
- Geekery
- Python
- Work
tags: []
comments:
- id: 157
  author: Tres Seaver
  author_email: tseaver@palladion.com
  author_url: http://palladion.com/
  date: !binary |-
    MjAwNS0xMC0xNyAxMzo0Mjo0MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0xNyAxMjo0Mjo0MSArMDEwMA==
  content: ! 'There is a recent thread on the zope-zpt mailing list about just this
    topic.


    If you *need* HTML as output, rather than XHTML, then you *can''t* allow the XML-isms
    to

    get emitted;  ZPTs HTML mode forces "empty" tags to have the extra space added,
    for

    instance ('''' instaead of '''').


    There may be a couple of others, mostly to do with working around "quirks mode"
    in the

    browsers.'
---
So we were having a 'discussion' on the work mailing list about a change I'd made to the UI code for <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a>.  Given the following page template:

[code lang="xml"]<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-&#47;&#47;W3C&#47;&#47;DTD XHTML 1.0 Strict&#47;&#47;EN"
                      "http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;DTD&#47;xhtml1-strict.dtd">
<html xmlns="http:&#47;&#47;www.w3.org&#47;1999&#47;xhtml" lang="en" xml:lang="en" i18n:attributes="lang language; xml:lang language"
  xmlns:tal="http:&#47;&#47;xml.zope.org&#47;namespaces&#47;tal"
  xmlns:metal="http:&#47;&#47;xml.zope.org&#47;namespaces&#47;metal"
  xmlns:i18n="http:&#47;&#47;xml.zope.org&#47;namespaces&#47;i18n">
  <head>
    <title tal:content="template&#47;title">The title<&#47;title>
  <&#47;head>
  <body>
    <p>
      <option tal:attributes="selected python:1==1">xxx<&#47;option>
      <option tal:attributes="selected python:1==0">yyy<&#47;option>
    <&#47;p>
  <&#47;body>
<&#47;html>[&#47;code]

both Andy and Kev asserted that it would render to:

[code lang="xml"]<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-&#47;&#47;W3C&#47;&#47;DTD XHTML 1.0 Strict&#47;&#47;EN"
                      "http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;DTD&#47;xhtml1-strict.dtd">
<html xmlns="http:&#47;&#47;www.w3.org&#47;1999&#47;xhtml" lang="en"
      xml:lang="en">
  <head>
    <title><&#47;title>
  <&#47;head>
  <body>
    <p>
      <option selected="selected">xxx<&#47;option>

      <option>yyy<&#47;option>
    <&#47;p>
  <&#47;body>
<&#47;html>[&#47;code]

while I was asserting that it rendered to:

[code lang="xml"]<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-&#47;&#47;W3C&#47;&#47;DTD XHTML 1.0 Strict&#47;&#47;EN"
                      "http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;DTD&#47;xhtml1-strict.dtd">
<html xmlns="http:&#47;&#47;www.w3.org&#47;1999&#47;xhtml" lang="en"
      xml:lang="en">
  <head>
    <title><&#47;title>
  <&#47;head>
  <body>
    <p>
      <option selected="True">xxx<&#47;option>
      <option selected="False">yyy<&#47;option>

    <&#47;p>
  <&#47;body>
<&#47;html>[&#47;code]

(note the difference in the rendering of the 'selected' attribute of the <code><option><&#47;code> tag.)

I had distilled mine down from the MailManager code, as a test instance, whereas both Kev &amp; Andy had created a fresh template in the ZMI.  And both of us appeared to be right.  We wondered if it was a difference in platform -- I'm working on my laptop, with python 2.4 &amp; Zope 2.7.7.  But no.  The difference is that I'm rendering the files as content-type text&#47;xml (which Zope kindly defaults to if it encounters a file starting <code><?xml ...<&#47;code> whereas they were forcing the content-type to text&#47;html (the default if you create a template through the ZMI).  If you force the content-type to text&#47;xml in the ZMI you'll see the same results as I get.

So it turns out that exactly the same Zope Page Templates will render slightly differently, depending on whether or not they are marked as being HTML or XML.  Cool.

(I can understand why they are pulled apart by different parsers, since it's so much nicer to use a proper XML parser if you're expecting valid XML -- and leave the grotty excuses for HTML that one sometimes finds to another lame, hacky thing -- but to not mangle them into the same AST and use a unified generator at the other end?)

When I've got more time, I should go file bugs.  But I've got an alpha of MailManager 2.1 to release this afternoon, so I'd better get on with that or there'll be no getting to go to the pub for me!
