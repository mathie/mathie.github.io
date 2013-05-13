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
