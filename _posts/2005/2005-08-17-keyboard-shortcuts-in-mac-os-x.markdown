---
layout: post
title: Keyboard shortcuts in Mac OS X
date: 2005-08-17 16:23:29 +01:00
categories:
- Geekery
- To do
---
I intend to write up a more full-featured post later, but I've been investigating how Mac OS X does key bindings for shortcuts.  In particular, I would like to know (and possibly modify) the full set of keyboard shortcuts for writing text.  As a long-time (X)Emacs user, I am prone to navigating around text with arcane shortcuts, some of which already appear to work in Mac OS X, some of which don't.  Hopefully my investigation will achieve two things:

<ul>
  <li>I can map some shortcuts to ones my fingers are familiar with.</li>
  <li>I can teach my fingers to use the new ones.</li>
</ul>

Actually, from the perspective of being able to use somebody else's Mac, without all my wierd customisations, it would be sensible for the latter to prevail over the former.  But we'll see.

<h3>Notes so far</h3>

<ul>
  <li><a href="http://developer.apple.com/documentation/Cocoa/Conceptual/InputManager/Concepts/KeyBindings.html" title="Text Input Management: About Key Bindings">About Key Bindings</a> notes that <code>NSMenu</code> gets hold of your keystroke first, so any menu shortcuts are going to override key bindings in your TextView.</li>
  <li>These key bindings are applicable to any Mac OS X Cocoa application, in any control that subclasses NSResponder.  Mostly they'll be useful for text boxes.  But this does mean that the key bindings will <em>not</em> work with Carbon applications.</li>
  <li>The default key bindings are stored in: [code]/System/ Library/ Frameworks/ AppKit.framework/ Resources/ StandardKeyBinding.dict[/code] but as far as I can tell aren't actually documented anywhere.</li>
  <li>They can be over-ridden in: [code]~/Library/KeyBindings/DefaultKeyBinding.dict[/code] Note that applications read this file on startup, so for changes to take effect, you'll have to quit and restart the program.</li>
  <li><a href="http://developer.apple.com/documentation/Cocoa/Reference/ApplicationKit/ObjC_classic/Classes/NSResponder.html" title="NSResponder class (Objective-C)">NSResponder</a>'s action methods are what you can invoke by pressing a keyboard shortcut.</li>
  <li>The mapping from symbolic names for function keys to their keycode equivalent can be found in <a href="http://developer.apple.com/documentation/Cocoa/Reference/ApplicationKit/ObjC_classic/Classes/NSEvent.html" title="NSEvent class (Objective-C)">NSEvent</a>'s header file.</li>
  <li>The format for specifying the key bindings is described nicely in <a href="http://macromates.com/blog/archives/2005/07/05/key-bindings-for-switchers/">key bindings for switchers</a>.</li>
  <li>Looking at this is making my head hurt. :-/</li>
</ul>

My first goal is to document what the default bindings actually are.  After that, I'll either convince my fingers to learn them or switch what I can to Emacs equivalents.

Of course, what prompted this was something else completely.  I'd set out to get âŒ˜-â‡§-D (command-shift-D -- which is 'send' in Mail.app) to be 'save and close' when writing commit messages for Subversion and CVS in <a href="http://macromates.com/">TextMate</a>...
