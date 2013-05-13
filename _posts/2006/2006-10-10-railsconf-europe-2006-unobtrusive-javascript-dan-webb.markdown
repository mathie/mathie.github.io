---
layout: post
title: ! 'RailsConf Europe 2006: Unobtrusive Javascript -- Dan Webb'
date: 2006-10-10 09:10:26 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- RailsConf Europe
- Ruby and Rails
comments:
- id: 613
  author: Luke Redpath
  author_email: contact@lukeredpath.co.uk
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0xMCAxMzo1OTo0MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAxMjo1OTo0MCArMDEwMA==
  content: <p>Im curious as to why you feel the behaviours should go in the controller.
    The behaviours are fully dependent on the view - a JS behaviour wouldn't make
    sense with some other kind of view (XML, RSS, web services etc.) so I think the
    view is the right place for this.</p>
- id: 614
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0xMCAxNDo0MjowMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAxMzo0MjowMSArMDEwMA==
  content: ! '<p>Luke: It seems to me that the <code>apply_behaviour</code> function
    is completely disjoint from the rest of the code in the view.  And it''s, well,
    code (behaviour), not presentation.  So in a way it doesn''t belong in the view.  Thinking
    about it, it doesn''t really belong in the controller either.</p>


    <p>To me, the ideal solution would be to have <code>app/behaviours</code> which
    mirrors <code>app/views</code> which behaves vaguely like an RJS file, so that
    you could write something like:</p>


    <pre><code>page.apply_behaviour ...

    </code></pre>


    <p>but it would be magically inserted into the corresponding view in the right
    place.</p>


    <p>I really like the idea of UJS, and I think this would complete the separation
    of behaviour from the rest of the cake.</p>


    <p>Does that make sense?  If not, I''ll think about it more and try to express
    myself more clearly.</p>'
- id: 615
  author: Luke Redpath
  author_email: contact@lukeredpath.co.uk
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0xMCAxNTo1MTowMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAxNDo1MTowMCArMDEwMA==
  content: ! '<p>mathie, that does make sense, and we have considered creating a "behaviour
    template". However I like having the behaviours inside the templates as I can
    easily see what behaviours are applied to different parts of the markup.</p>


    <p>I still maintain that javascript behaviours are part of the overall "view"
    package though - it is the behaviour of your user interface, rather than app logic
    (controller) or business logic (model).</p>'
- id: 616
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0xMCAxNjoxMDoyOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMCAxNToxMDoyOCArMDEwMA==
  content: Luke, chances are my ideas on how it should work will change when I actually
    start using it in anger. :-)  I can see the advantage of having the behaviour
    applied to the view visible alongside the view.
---
> This is the eleventh in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

The client side of a web application can be seen as a cake. In the past few
years we've finally managed to separate that cake into two distinct layers:
content and style. With 'web 2.0' we have a third layer: behavior (ie
Javascript). When we add behaviour to a web application, we're *enhancing* the
behaviour of an existing application. In other words, *it should still work
without the fancy AJAX stuff!*

Unfortunately, Rails' Javascript helpers don't mesh well with unobtrusive JS,
and they don't create semantically correct HTML. For example, `link_to_remote`
produces `<a href="##" ...>`. It should link to something -- after all that's
(well, mostly!) what the `<a />` tag is supposed to do. Also, if you specify a
default behaviour by supplying an `href` then browsers without Javascript
support will still have functionality.

Links should *never* have side effects. For example, an action to delete an
object shouldn't be a link. Why? We all learned the hard way when Google Web
Accelerator was released. It looks for links on a page and prefetches them,
for a faster browsing experience. So it'll follow your 'delete' link if the
user clicks on it or not. *Shazam*, you've been deleted. Use `button_to`
instead, which creates a small form with a submit button.

One thing brought up in the questions afterwards was about styling buttons.
The `<input type="submit" ... />` style of button isn't particularly flexible
when it comes to styling, but apparently the `<button ... />` element is and
has the same effect.

Since I'm a Javascript newbie, I picked up a useful tip. If an event returns
'false' when it's finished then the default behaviour of the event doesn't
happen. For example, if you've got an `<a href="/foo/bar" onclick="...">`
then, if the `onclick` event returns false, the link will not be followed. I
noted this because it had bitten me with an application I've been writing...

Dan introduced his and Luke's [UJS Rails Plugin](http://ujs4rails.com/) which
provides a bunch of helpers to apply behaviour neatly to your views. Instead
of directly putting JS code into particular elements (be it with Rails' own
helpers, or straight JS), you call `apply_behaviour` at the end of the view
using CSS style selectors. It really cleans up the view code, which is nice,
and promotes the idea of creating a UI that works then adding AJAXy goodness.

There was one thing that struck me at the time, and I wish I'd asked Dan about
it. It seems to me that applying behaviours to DOM elements is writing code.
And that doesn't belong in the view. I wonder if there would be some mechanism
to specify the behaviours in the controller? Or maybe it belongs somewhere
entirely new?

Oh, and I've got to ask, from looking at his demo app. Who the hell would pay
$500 for a pair of [gutties](http://www.wordwebonline.com/en/GUTTY)?!? :-)
