---
layout: post
status: publish
published: true
title: Page templates, macros and slots
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 46
wordpress_url: http://woss.name/?p=46
date: 2005-08-11 11:45:43.000000000 +01:00
categories:
- Geekery
- Python
- Work
tags: []
comments: []
---
I'm just writing this down so I get it clear in my head, so I can be consistent when I'm writing this code.  From playing around with it this morning, I've noticed the following rules with respect to METAL macros, slots and how they interact to produce the final HTML page:

<ul>
<li>The tag with the attribute <code>metal:define-slot<&#47;code> is <em>replaced<&#47;em> (ie the tag and its content is removed and replaced) by the tag with the matching <code>metal:define-slot<&#47;code>.<&#47;li>
<li>Therefore, any attributes alongside a <code>metal:define-slot<&#47;code> are <em>discarded<&#47;em> when its tag is replaced.<&#47;li>
<&#47;ul>

So, doing the following:

[code lang="xml"]...
<div id="subnav" metal:define-slot="subnav_menu">
  Insert second-level menu here
<&#47;div>
...
<div metal:fill-slot="subnav_menu">
  <ul>
    <li>First link<&#47;li>
    <li>Second link<&#47;li>
    <li>Third link<&#47;li>
  <&#47;ul>
<&#47;div>[&#47;code]

will produce the following HTML:

[code lang="xml"]...
<div>
  <ul>
    <li>First link<&#47;li>
    <li>Second link<&#47;li>
    <li>Third link<&#47;li>
  <&#47;ul>
<&#47;div>[&#47;code]

Note the missing <code>id<&#47;code> attribute.  In order to do what I actually want to achieve, which is to label the subnav menu -- that will be different in different templates -- with the id 'subnav', I need to do one of two options:

[code lang="xml"]...
<div metal:define-slot="subnav_menu">
  Insert second-level menu here
<&#47;div>
...
<div id="subnav" metal:fill-slot="subnav_menu">
  <ul>
    <li>First link<&#47;li>
    <li>Second link<&#47;li>
    <li>Third link<&#47;li>
  <&#47;ul>
<&#47;div>[&#47;code]

or

[code lang="xml"]...
<div id="subnav">
  <div metal:define-slot="subnav_menu">
    Insert second-level menu here
  <&#47;div>
<&#47;div>
...
<div metal:fill-slot="subnav_menu" tal:omit-tag="">
  <ul>
    <li>First link<&#47;li>
    <li>Second link<&#47;li>
    <li>Third link<&#47;li>
  <&#47;ul>
<&#47;div>[&#47;code]

The second is more verbose, but I think I also prefer it, since that way there's less repetition.  Say I want to rename the 'subnav' id to something else because it clashes with another application that MailManager gets embedded in -- would I rather change it in two places or twenty?  Now I just need to go back through my code and make sure I'm doing this consistently!

<strong>Update<&#47;strong> Or I could refine the second example a little more to remove the tag omission.  Duh:

[code lang="xml"]...
<div id="subnav">
  <div metal:define-slot="subnav_menu">
    Insert second-level menu here
  <&#47;div>
<&#47;div>
...
<ul metal:fill-slot="subnav_menu">
  <li>First link<&#47;li>
  <li>Second link<&#47;li>
  <li>Third link<&#47;li>
<&#47;ul>[&#47;code]
