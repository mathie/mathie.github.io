---
layout: post
status: publish
published: true
title: Keyboard shortcuts in Mac OS X
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 58
wordpress_url: http://woss.name/?p=58
date: 2005-08-17 16:23:29.000000000 +01:00
categories:
- Geekery
- To do
tags: []
comments: []
---
I intend to write up a more full-featured post later, but I've been investigating how Mac OS X does key bindings for shortcuts.  In particular, I would like to know (and possibly modify) the full set of keyboard shortcuts for writing text.  As a long-time (X)Emacs user, I am prone to navigating around text with arcane shortcuts, some of which already appear to work in Mac OS X, some of which don't.  Hopefully my investigation will achieve two things:

<ul>
  <li>I can map some shortcuts to ones my fingers are familiar with.<&#47;li>
  <li>I can teach my fingers to use the new ones.<&#47;li>
<&#47;ul>

Actually, from the perspective of being able to use somebody else's Mac, without all my wierd customisations, it would be sensible for the latter to prevail over the former.  But we'll see.

<h3>Notes so far<&#47;h3>

<ul>
  <li><a href="http:&#47;&#47;developer.apple.com&#47;documentation&#47;Cocoa&#47;Conceptual&#47;InputManager&#47;Concepts&#47;KeyBindings.html" title="Text Input Management: About Key Bindings">About Key Bindings<&#47;a> notes that <code>NSMenu<&#47;code> gets hold of your keystroke first, so any menu shortcuts are going to override key bindings in your TextView.<&#47;li>
  <li>These key bindings are applicable to any Mac OS X Cocoa application, in any control that subclasses NSResponder.  Mostly they'll be useful for text boxes.  But this does mean that the key bindings will <em>not<&#47;em> work with Carbon applications.<&#47;li>
  <li>The default key bindings are stored in: [code]&#47;System&#47; Library&#47; Frameworks&#47; AppKit.framework&#47; Resources&#47; StandardKeyBinding.dict[&#47;code] but as far as I can tell aren't actually documented anywhere.<&#47;li>
  <li>They can be over-ridden in: [code]~&#47;Library&#47;KeyBindings&#47;DefaultKeyBinding.dict[&#47;code] Note that applications read this file on startup, so for changes to take effect, you'll have to quit and restart the program.<&#47;li>
  <li><a href="http:&#47;&#47;developer.apple.com&#47;documentation&#47;Cocoa&#47;Reference&#47;ApplicationKit&#47;ObjC_classic&#47;Classes&#47;NSResponder.html" title="NSResponder class (Objective-C)">NSResponder<&#47;a>'s action methods are what you can invoke by pressing a keyboard shortcut.<&#47;li>
  <li>The mapping from symbolic names for function keys to their keycode equivalent can be found in <a href="http:&#47;&#47;developer.apple.com&#47;documentation&#47;Cocoa&#47;Reference&#47;ApplicationKit&#47;ObjC_classic&#47;Classes&#47;NSEvent.html" title="NSEvent class (Objective-C)">NSEvent<&#47;a>'s header file.<&#47;li>
  <li>The format for specifying the key bindings is described nicely in <a href="http:&#47;&#47;macromates.com&#47;blog&#47;archives&#47;2005&#47;07&#47;05&#47;key-bindings-for-switchers&#47;">key bindings for switchers<&#47;a>.<&#47;li>
  <li>Looking at this is making my head hurt. :-&#47;<&#47;li>
<&#47;ul>

My first goal is to document what the default bindings actually are.  After that, I'll either convince my fingers to learn them or switch what I can to Emacs equivalents.

Of course, what prompted this was something else completely.  I'd set out to get &acirc;&OElig;&tilde;-&acirc;&Dagger;&sect;-D (command-shift-D -- which is 'send' in Mail.app) to be 'save and close' when writing commit messages for Subversion and CVS in <a href="http:&#47;&#47;macromates.com&#47;">TextMate<&#47;a>...
