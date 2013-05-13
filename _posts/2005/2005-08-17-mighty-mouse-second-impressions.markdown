---
layout: post
title: ! 'Mighty Mouse: Second Impressions'
date: 2005-08-17 17:45:04 +01:00
categories:
- Geekery
comments:
- id: 44
  author: Nerfboy
  author_email: woss.name-blog@nerfboy.com
  author_url: http://www.greenGiraffeGames.com
  date: !binary |-
    MjAwNS0wOC0xOCAxMDoyODoyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0xOCAwOToyODoyMyArMDEwMA==
  content: ! 'What''s wrong with the <a href="http://www.microsoft.com/hardware/mouseandkeyboard/productdetails.aspx?pid=004"
    rel="nofollow">IntelliMouse Optical</a>?


    I like the fact that Apple are finally supporting other buttons (lets hope the
    laptops do too!), but some things about the mouse seem to be style over substance
    - shape for instance.


    Have you had any problems with right clicks when your left finger is touching
    the surface?


    Oh and I would recommend left side button as "back" and right side button as "forward",
    it rocks!'
- id: 45
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0wOC0xOCAxNjowNzoyMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0xOCAxNTowNzoyMCArMDEwMA==
  content: ! 'Never tried the IntelliMouse... Up until now I''ve been using a Logitech
    Trackman Marble -- for going on 10 years now, in fact.


    I hadn''t noticed ''til you mentioned (apparently my left finger doesn''t rest
    on the body of the mouse when I''m using the right button) but, yes, right-clicking
    while resting a finger on the ''left button'' does register a left click...'
- id: 46
  author: Tom
  author_email: Courthold@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0xNiAxMjoxNjoxMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0xNiAxMToxNjoxMyArMDAwMA==
  content: Did you ever solve the scroll-ball not scrolling up issue? Mine seems to
    be doing the same, and I can't for the life of me unstick it.
- id: 47
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0xMS0xNiAxMjoxOToyNCArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0xNiAxMToxOToyNCArMDAwMA==
  content: ! 'Tom: Not at all.  In fact, it pretty much only ever scrolls left and
    right these days -- a feature I rarely want to use.  It''s getting annoying enough
    that I''m probably going to swap back for my Logitech Trackman Marble soon...'
---
Well, I've been using the <a href="http://woss.name/2005/08/08/mighty-mouse-first-impressions/" title="Mighty Mouse: First Impressions">Mighty Mouse</a> for just over a week now.  I thought it might be time to write up some more impressions of it.  Though perhaps this isn't a good time, since it's really bugging me just now!  That which I described as 'neat' in the previous article -- that if you whisk the scroll ball to the left, it will jump back in your browser history?  Freakin' annoying!  Say, for example, you've just written a massive big post in the <a href="http://wordpress.org/">Wordpress</a> 'write post' window, but the 'Save' button is just out of your current screen view.  So you go to the scroll ball to move down the page a little and click on the button.  Only you accidentally click it to the left slightly.  Bye bye post!  That behaviour will have to go.  (Ooh, I might have found the solution, in the <a href="http://www.macnn.com/articles/05/08/09/mighty.mouse.review/">last comment of this review</a>.  I guess I'll have to restart Firefox to find out, though, and I'd like to finish this psot first!)

The other major irritation?  The scroll ball is currently refusing to scroll up, and isn't so keen on scrolling down either.  I suspect this may be because the office is very warm this afternoon and my paws are a bit sweaty, but it's still extremely irritating!

Oh, and it occasionally decided to move the pointer in exactly the opposite direction to the one I'm trying to direct it in.  But maybe that's just because I'm not on the 'right' surface (I'm just directly onto a beech-lamite desk).

On the other hand, I <em>do</em> like the scroll ball in general.  And it's useful to have it bring up the Dashboard when I press it -- I now use the Dashboard more often too.  And the 'fourth' button, despite having to squeeze just a little too hard, is great for getting to Expos&eacute; quickly to switch to another window.  OK, <code>command-tab</code> does the same thing quicker, but this is prettier. :-)

If the scroll ball issues are temporary, all in all I really like the new mouse.

<strong>Update</strong>  Well, it's not restarting Firefox that cured the problem, it's fiddling with the correct configuration variables.  In order to stop the mighty mouse' horizontal scrolling action from moving backwards and forwards through your history, do the following:

<ul>
  <li>In the address bar, type the location <a href="about:config">about:config</a>.  (The link might work, but load it into a new window/tab so you can still see these instructions!)</li>
  <li>To make it easier to find, enter 'horizscroll.withnokey' into the filter text box.</li>
  <li>Change the following value, by double clicking on the name:
  <ul><li><strong>mousewheel.horizscroll.withnokey.action</strong>  A dialog box will appear asking you to enter a new value.  Change the value to '0' and click OK.</li>
    <li><strong>mousewheel.horizscroll.withnokey.numlines</strong>  A dialog box will appear asking you to enter a new value.  Change the value to '1' and click OK.</li>
    <li><strong>mousewheel.horizscroll.withnokey.sysnumlines</strong>  The value will change from 'false' to 'true' just by double-clicking.</li>
  </ul></li>
  <li>Note that all three settings are now in bold and that the status is 'user set'.  You're done.  It should scroll horizontally like every other application now.</li>
</ul>
