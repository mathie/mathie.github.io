---
layout: post
status: publish
published: true
title: ! 'RailsConf 2007: Is Javascript over-rated?'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 422
wordpress_url: http://woss.name/2007/05/17/railsconf-2007-is-javascript-over-rated/
date: 2007-05-17 20:59:25.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconf
- RailsConf Europe
- railsconf07
- Ruby and Rails
comments: []
---
The first tutorial of the weekend I signed up for was "Is Javascript Overrated? (Or how I learned to stop worrying and love Prototype & script.aculo.us)".  I never quite get around to doing enough JS work, instead finding other <del>willing victims<&#47;del> colleagues who are more into that kind of thing.  But I'm definitely interested in being able to do more of the front end UI myself.  So, I figured this tutorial would be useful.

Checking out my notes, I've discovered a few bits and pieces about Prototype & script.aculo.us that I didn't know before.  The highlights would be:

* `$$` has full support for CSS 1, 2 & 3 selectors. eg `$$('table tbody > tr:nth-child(even)').invoke('addClassName', 'even')` will select every second row of a table and give it the class 'even'. Neater than doing some `cycle` type thing.

* New with 1.5: DOM traversal. `$('id').down()` picks the first child, `$('id').up()` picks the parent. `next()` and `previous()` pick siblings. `$('id').descendantOf('parent_id')` returns a boolean.

* `$('form').focusFirstElement()` does exactly what it says on the tin.

* The form validation demo code he showed off looks really neat.  It makes use of a (non-strict-HTML) `format` attribute, then does some validation on `onsubmit`.  The actual validation functions are all added to the appropriate Element subclasses.  Very neatly done.  I'm wondering if anybody has done some work to integrate this with Rails model validations and make it more robust...?

* Official JSON library breaks Prototype enumerables, so don't use it! Doesn't matter because Prototype implements everything anyway.

* `transition` option for effects determines the function used to affect the dx&#47;dy of the argument passed in to update. Apparently, sinoidal looks more natural for moving effects than linear, so that it accelerates & decelerates.

* New in scriptaculous 1.7: `Effect.morph()` which will change from existing CSS styling to a newly specified one over a period of time. For example, grow a font size or move items around. Difficult to explain, but it looks pretty sweet. :) Best to use for mocking up an effect, because it has performance issues from parsing the CSS.

* Firebug will actually show you the transitions happening (delayed, though). Inspect the element, then run the effect, and Firebug will show you the style attributes changing, highlighting them in yellow as they change.

* Effects have an `inspect()` function to use from the Firebug console.

* `Element.addMethods()` to put custom effects on elements (so that you can just do `$('id').customEffect()`) looks pretty powerful.

Umm, that's about it, I think.  To be honest, I was a little disappointed -- the tutorial was pretty low bandwidth and didn't introduce much I couldn't have found by looking at the manual.  Then again, I'm not sure what I *was* expecting...

One question I'd meant to ask since he mentioned it: Is there an idiomatic way of having an `initialize()` method in a subclass which calls the `initialize()` from its parent class? (The equivalent of doing `super` in Rails.)  I'm not too fussed about a generic solution that works for every method, but one that at least works for `initialize` would be good.
