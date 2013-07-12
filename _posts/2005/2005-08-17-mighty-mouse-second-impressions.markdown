---
layout: post
title: ! 'Mighty Mouse: Second Impressions'
date: 2005-08-17 17:45:04 +01:00
categories:
- Geekery
---
Well, I've been using the [Mighty Mouse](http://woss.name/2005/08/08/mighty-mouse-first-impressions/) for just over a week now.  I thought it might be time to write up some more impressions of it.  Though perhaps this isn't a good time, since it's really bugging me just now!  That which I described as 'neat' in the previous article -- that if you whisk the scroll ball to the left, it will jump back in your browser history?  Freakin' annoying!  Say, for example, you've just written a massive big post in the [Wordpress](http://wordpress.org/) 'write post' window, but the 'Save' button is just out of your current screen view.  So you go to the scroll ball to move down the page a little and click on the button.  Only you accidentally click it to the left slightly.  Bye bye post!  That behaviour will have to go.  (Ooh, I might have found the solution, in the [last comment of this review](http://www.macnn.com/articles/05/08/09/mighty.mouse.review/).  I guess I'll have to restart Firefox to find out, though, and I'd like to finish this psot first!)

The other major irritation?  The scroll ball is currently refusing to scroll up, and isn't so keen on scrolling down either.  I suspect this may be because the office is very warm this afternoon and my paws are a bit sweaty, but it's still extremely irritating!

Oh, and it occasionally decided to move the pointer in exactly the opposite direction to the one I'm trying to direct it in.  But maybe that's just because I'm not on the 'right' surface (I'm just directly onto a beech-lamite desk).

On the other hand, I *do* like the scroll ball in general.  And it's useful to have it bring up the Dashboard when I press it -- I now use the Dashboard more often too.  And the 'fourth' button, despite having to squeeze just a little too hard, is great for getting to Expos&eacute; quickly to switch to another window.  OK, <code>command-tab</code> does the same thing quicker, but this is prettier. :-)

If the scroll ball issues are temporary, all in all I really like the new mouse.

**Update**  Well, it's not restarting Firefox that cured the problem, it's fiddling with the correct configuration variables.  In order to stop the mighty mouse' horizontal scrolling action from moving backwards and forwards through your history, do the following:

<ul>
  <li>In the address bar, type the location [about:config](about:config).  (The link might work, but load it into a new window/tab so you can still see these instructions!)</li>
  <li>To make it easier to find, enter 'horizscroll.withnokey' into the filter text box.</li>
  <li>Change the following value, by double clicking on the name:
  <ul><li><strong>mousewheel.horizscroll.withnokey.action</strong>  A dialog box will appear asking you to enter a new value.  Change the value to '0' and click OK.</li>
    <li><strong>mousewheel.horizscroll.withnokey.numlines</strong>  A dialog box will appear asking you to enter a new value.  Change the value to '1' and click OK.</li>
    <li><strong>mousewheel.horizscroll.withnokey.sysnumlines</strong>  The value will change from 'false' to 'true' just by double-clicking.</li>
  </ul></li>
  <li>Note that all three settings are now in bold and that the status is 'user set'.  You're done.  It should scroll horizontally like every other application now.</li>
</ul>
