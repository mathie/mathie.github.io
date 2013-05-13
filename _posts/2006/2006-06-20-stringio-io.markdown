---
layout: post
title: StringIO !&lt; IO
date: 2006-06-20 15:39:35 +01:00
categories:
- Geekery
tags:
- Geekery
comments:
- id: 500
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0wNi0yMCAxNjozOTowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yMCAxNTozOTowMyArMDEwMA==
  content: <p>C   iostreams handle this by having the interface class work in terms
    of a generic stream buffer interface with a very thin API. Rather than have something
    emulate the iostream interface for a new object type you just replace the buffer
    interface with a new one, avoiding skew between the two interfaces.</p>
---
Argh.  For that which I'm working on just now, I'm modifying the IO object to add a couple of extra convenience methods (`read_nibble_pair` and `read_int16` for want of better names).  The first reads a pair of nibbles (I said *nibbles* -- no sniggering in the back there!) that are packed into a single byte.  The latter reads a 16-bit integer stored in big-endian format.  I figure reopening the `IO` class and adding these convenience methods, based around the existing `getc` method, is the right thing to do.

It took me a while to figure out why the tests weren't passing, though.  I'd created a few `StringIO` objects as handy byte streams for testing and couldn't get it to see my new functions.  Hmm.  Turns out that `StringIO` doesn't inherit from (specialise) `IO`.  I can see why: it's only emulating `IO`'s interface and probably wouldn't share much of the underlying implementation.  But it seems somehow wrong to me to have something which behaves like an IO object but doesn't actually have anything to do with the real `IO` object other than coincidentally having a similar interface.

I suspect somebody is going to use the phrase 'duck typing' in the comments shortly. :-)  And in which case, I shall be forced to hereby call the solution in my head (creating the extra methods as a module and mixing it in to both `IO` and `StringIO`) something along the lines of 'gaffer typing'...
