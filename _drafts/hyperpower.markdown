---
title: HYPERPOWER!
subtitle: Putting the caps lock key to work
category: Ops
tags:
  - hyper
  - capslock
  - Alfred
  - Seil
  - Karabiner
---

I can't recall how I came across it, but recently I read a post on
[A useful Caps Lock key](http://brettterpstra.com/2012/12/08/a-useful-caps-lock-key/)
and I've actually started *using* a key that's sitting on the home row, so
tantalisingly close to my left pinky. So I thought I'd share my discovery, and
the slightly different tack I've taken, just in case it helps somebody else
reduce their RSI. I'm actively monitoring my workflow now, looking for
additional repetitive tasks I perform that could be bound to my new HYPERPOWER!
key. (Nine Inch Nails, from the Year Zero album, in case, like me, the word
'hyper' sparked something in your memory, but it took a while to make the
connection.) I'd love to hear your suggestions of what we could shorten. :)

It's a bit awkward to turn the caps lock key into something remarkably useful,
but it comes down to four things:

* Switching off its default behaviour, because who needs to WRITE IN ALL
  CAPITALS WITHOUT HOLDING DOWN THE SHIFT KEY? (I held down the shift key while
  I was writing that, and it's the hardest work my left pinkie has done all
  day.) This option is baked into Mac OS X, though it's a little tricky to
  find, if you don't already know where.

* Make the caps lock key perform two different operations, depending on how
  long you hold it down for. This pays homage to the vi(m) users, because we'll
  turn the caps lock key into an escape if you tap it, and only give it
  HYPERPOWER! if you hold it down for a wee while.

* If you hold down the caps lock key for a short while -- enough to find its
  key combination -- then we'll turn it into a different keypress (really, the
  equivalent of holding down multiple other keys) so that we can assign
  behaviour to the combination of it and other keypresses.

* Finally, we'll set up a pile of global shortcut keypresses (our new shortcut
  key, combined with others) to automate tasks that previously tired out our
  poor old fingers.

The bad news is that doing all this requires a couple of third party programs.
The worse news is that doing all this requires a couple of third party kernel
extensions. The good news is that they seem stable enough, are open source and
(I hope!) are well enough reviewed that they aren't logging all my keystrokes
to MI5. ;-) (Though I'm sure your Intelligence Agency could read these
keystrokes easily enough anyway...!)

## Switching off Caps Lock

I've been doing this bit for years. On every new Mac, on every fresh install of
Mac OS X, one of the first things I've done is just to disable the caps lock
key entirely. Why? It's annoyingly easy to press. And it's particularly
irritating when you accidentally fat-finger it before entering a (case
sensitive) password. On the plus side, Mac OS X now gives you a visual
indication when the caps lock is active in a password field, but still. Let's disable it:

* Head to System Preferences;

* Go to the Keyboard preferences;

* Under the 'Keyboard' tab, click 'Modifier Keys...';

* In the Caps Lock drop-down, select 'No Action' and click 'OK'.

There we go, that's the caps lock key neutered. Hit it and note that the wee
light on the top left doesn't come on. Winning.

<div class="row">
  <div class="col-sm-10 col-sm-offset-1">
    <a href="#keyboard-preferences-lightbox" data-toggle="lightbox" class="thumbnail text-muted text-center" title="Click for a larger version.">
      <img src="/img/keyboard-preferences.png" alt="Switching off the Caps Lock key in system preferences.">
      <small>Click for a larger version.</small>
    </a>
  </div>
</div>

<div id="keyboard-preferences-lightbox" class="lightbox fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="lightbox-dialog">
    <div class="lightbox-content">
      <img src="/img/keyboard-preferences.png" alt="Kittens!">
      <div class="lightbox-caption">
        Switching off the Caps Lock key in system preferences.
      </div>
    </div>
  </div>
</div>

## Putting the Caps Lock Key to Work


