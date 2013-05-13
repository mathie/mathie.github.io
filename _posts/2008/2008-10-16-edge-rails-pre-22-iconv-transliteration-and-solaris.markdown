---
layout: post
status: publish
published: true
title: Edge Rails (pre-2.2), iconv, transliteration and Solaris
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2008-10-16 15:20:34.000000000 +01:00
categories:
- Ruby and Rails
- Solaris
- Work
tags: []
comments:
- id: 1021
  author: Andy Steingruebl
  author_email: steingra@gmail.com
  author_url: http://securityretentive.blogspot.com/
  date: !binary |-
    MjAwOC0xMC0xNiAxNTo0MzowNCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0xNiAxNDo0MzowNCArMDEwMA==
  content: ! '<p>If you want to change this globally you can also toy around with
    the crle command to change the default search path that ld.so uses.  Not that
    I''d recommend it in this case, but still its an option for this type of issue.</p>


    <p>Your best approach is to rebuild ruby to point at a different version of libiconv.</p>'
- id: 1022
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0xMC0xNiAxNTo1MzozOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0xNiAxNDo1MzozOSArMDEwMA==
  content: ! '<p>@Andy I think it''s insane to change the default behaviour of <code>iconv(3)</code>
    globally for the entire system to use GNU iconv.  But on the other hand, I might
    actually be insane.  So far it''s working!  The magic invocation to make it happen
    is:</p>


    <pre><code>bash-3.2$ pfexec crle -u -E LD_PRELOAD=/usr/gnu/lib/preloadable_libiconv.so

    </code></pre>


    <p>Thanks for the pointer to <code>crle</code>. :-)</p>'
---
I've been having trouble with edge Rails on Solaris for the past few days, and I finally decided to figure out what the problem actually was.  It all boiled down to this method here (from [activesupport/lib/active_support/inflector.rb](http://github.com/rails/rails/tree/e0993c6c376d62716757a8a7f476ed0c369d0fc7/activesupport/lib/active_support/inflector.rb)#275):

<script src="http://gist.github.com/17126.js"></script>

It would appear that the C library implementation of `iconv(3)` on my build of OpenSolaris (Nevada build 99) doesn't actually support transliteration, so this code was raising an exception:

    Iconv::InvalidEncoding: invalid encoding ("ascii//translit//IGNORE", "utf-8")

every time the inflector was required (which was every time Rails was loaded in any way).  That sucked somewhat because it meant I couldn't deploy an application I was working on!

It took me a while to realise that the C library implementation of iconv here was somewhat lacking (I assumed everybody just used GNU iconv these days).  Turns out the solution is to install the SUNWgnu-libiconv package on Nevada:

    bash-3.2$ pfexec pkg install SUNWgnu-libiconv

That'll install the appropriate libraries but, as you can see, all is still not well:

    bash-3.2$ irb
    irb(main):001:0> require 'iconv'
    => true
    irb(main):004:0> Iconv.iconv('ascii//translit//IGNORE', 'utf-8', "fôôø").to_s
    Iconv::InvalidEncoding: invalid encoding ("ascii//translit//IGNORE", "utf-8")
         from (irb):4:in `iconv'
         from (irb):4
         from :0

You also must force the GNU version of the library to preload so that it takes over from the built-in implementation of `iconv(3)`:

    bash-3.2$ LD_PRELOAD="/usr/gnu/lib/preloadable_libiconv.so" irb
    irb(main):001:0> require 'iconv'
    => true
    irb(main):004:0> Iconv.iconv('ascii//translit//IGNORE', 'utf-8', "fôôø").to_s
    => "f^oo^o"

That's all well and good for individual sessions of `irb(1)` but that's going to be somewhat cumbersome to roll into all of our Rails deployments.  I'm still trying to find a workable solution to apply this "globally".  Here's what I've tried so far, and failed to make work:

* Find a sensible global place to set LD_PRELOAD so that every application will catch it.  This seems somewhat scattergun and a bit dangerous.

* Replace the ruby binary with a shell script that sets LD_PRELOAD then calls the real Ruby binary.  This sorta worked, but it breaks every she-bang-ed script because `#!/path/to/ruby` is no longer an ELF binary, but a shell script.  Chances are this would be a winning strategy if I could figure out how to code it in C.

* Relinking the `iconv.so` Ruby library to add a reference to `libgnuiconv.so`.  This was a total stab in the dark because I don't even know if you can relink dynamic libraries after the fact.

Needless to say, none of these strategies worked, so I think I'm back to recompiling Ruby from source.  Yee ha.  Perhaps now is a good time to try out [Ruby Enterprise Edition](http://www.rubyenterpriseedition.com/), see what happens...
