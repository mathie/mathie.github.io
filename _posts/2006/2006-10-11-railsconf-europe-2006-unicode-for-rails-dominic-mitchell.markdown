---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: Unicode for Rails -- Dominic Mitchell'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-10-11 09:07:36.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- RailsConf Europe
- Ruby and Rails
comments:
- id: 617
  author: Anthony Bailey
  author_email: mail@anthonybailey.net
  author_url: http://anthonybailey.net/blog
  date: !binary |-
    MjAwNi0xMC0xMSAyMTozNTowMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMSAyMDozNTowMiArMDEwMA==
  content: <p>I just wanted to say "thanks" for taking the time and trouble to do
    all twelve write-ups, and in fine style.</p>
- id: 618
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0xMiAwOTozNjo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMiAwODozNjo0MiArMDEwMA==
  content: ! '<p>Anthony: I''m glad they were of use to somebody else too. :)</p>'
- id: 619
  author: James McCarthy
  author_email: james2mccarthy@gmail.com
  author_url: http://fluct.isono.us
  date: !binary |-
    MjAwNi0xMC0xMiAxMzo1ODoyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMiAxMjo1ODoyNCArMDEwMA==
  content: <p>Another thank you. Great concise notes, a gift that passes a lot of
    us by.</p>
- id: 620
  author: Migrating your Rails application to Unicode at Notes from a messy desk
  author_email: ''
  author_url: http://woss.name/2006/10/25/migrating-your-rails-application-to-unicode/
  date: !binary |-
    MjAwNi0xMC0yNSAxNTo0NzoyMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAxNDo0NzoyMSArMDEwMA==
  content: <p>[...] Most of the instructions here were gleamed from a jabbering giraffe
    and the notes I wrote up from his talk. But I like to think I&#8217;ve had a bright
    idea of my own.  Note that these instructions assume you&#8217;re using Ruby 1.8.x,
    MySQL &gt;= 5 and edge (soon to be 1.2) rails. [...]</p>
- id: 621
  author: Damian Janowski
  author_email: damian.janowski@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMS0yOCAyMToyNzo1MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yOCAyMDoyNzo1MyArMDAwMA==
  content: ! '<p>Great article!

    It solved the problem I was dealing with for 3-4 hours. Thanks :)</p>'
---
> This is the twelfth (and final!) in a series of articles of me writing up my notes
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

Ruby (and therefore Rails) has a bad reputation for Unicode support. Dominic
started by giving an overview of the various standards for character sets and
encodings that led us to the current situation:

* First there was ASCII (he never did mention EBCDIC) which used 7 bits and
  represented 95 printable characters, along with some control characters. It
  didn't exactly cater for foreign languages, even other western languages
  that just have minor character variations like accents.

* ISO-8859 was developed in the mid 80s with different code pages for
  different languages. Effectively this meant that a code point would
  represent a different glyph depending on the choice of code page. This made
  data interchange difficult.

* ISO-2022-JP was created to represent Japanese characters. Its code points
  were multi-byte sequences with 'mode switching' which meant that you had to
  linearly process a string from the start -- you couldn't just jump into the
  middle because you wouldn't know what mode you were in.

* Windows-1252. This was a variation on the ISO-8859 standard, which used
  empty space (unused code points) in the code page to insert other
  characters. Like em-dashes and smart quotes. (Which is why you get weird
  characters when you copy'n'paste from a Word document...)

* Now we have Unicode. It's a 21-bit character set which means it has the
  capacity for about 2 million characters, of which around 10,000 are
  currently assigned.

Since Unicode code points can be up to 21 bits long, we need to find a way of
encoding them. There are 3 possibilities:

* UTF-32. Every character uses 4 bytes. It's a dead simple implementation, but
  very wasteful because 11 bits (about a third) on each character are going to
  waste.

* UTF-16. Pretty wasteful for Western languages because most of their
  characters can be stored in a single byte and it's likely that every second
  byte will be null. However, it is commonly used on Windows and in Java.

* UTF-8. This one is ASCII compatible for the first 7 bits which makes it
  backward compatible with existing ASCII text. Apparently it was Ken Thompson
  & Rob Pike that doodled this encoding system on the back of a napkin one
  day...

One of the features of Unicode is that single printed (or displayed) character
can be composed of multiple code points. The generic name for a single
displayed character is a *grapheme*, which can be made up of several *glyphs*.
This allows you to construct combinations of characters that the Unicode
authors had not foreseen. Like, for example, a lowercase 'k' with a
circumflex.

Since we can compose characters in different ways, there's a possibility that
two strings could be the same, but represented by different sets of code
points (glyphs). So we need a technique to normalise strings before comparing
them. There are four different mechanisms specified in the Unicode standard,
but the W3C has stated that NFC is the one everybody should use. It composes
graphemes into single glyphs if at all possible.

So, that's what Unicode is all about.  Convention is: use UTF-8 and NFC.  Sorted.

What about getting Unicode support in Rails? As far as the browser goes, HTML
forms are generally sent back in the same encoding as the page's character
set. So make sure you set your HTML pages' character set to UTF-8, usually
with:

    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />

somewhere in the head of all your HTML pages. You might also want to configure
your web server to explicitly tell the browser that the character set is UTF-8
too (eg `AddDefaultCharset UTF-8` in Apache). There is the `accept-charset`
attribute on forms, but apparently it is not well supported in browsers.

In Ruby, setting `$KCODE="utf8"` early in your `config/environment.rb` will
switch you into Unicode mode. From there, there's limited support for Unicode
strings: regular expressions will be Unicode-aware if you pass in the 'u'
flag; and pack/unpack will work with Unicode strings. There are a number of
different packages to provide additional Unicode support, the most promising
of which (to me) sounds like character-encodings. It claims to be similar to
how Unicode support will be in Ruby 2.0.

I did pick up another useful thing that I want to incorporate into an application I'm writing just now: use `iconv` to turn MS 'smart' quotes and other funny characters into UTF-8:

    Iconv.new("UTF-8", "WINDOWS-1252").iconv stuff

From the database perspective, you need to set the encoding on the database when you create it, which would be something along the lines of:

    CREATE DATABASE foo CHARACTER SET utf8 COLLATE utf8_general_ci;

and you need to set the encoding of the connection to the database, in the appropriate stanzas in `config/database.yml`:

    production:
      user: root
      host: localhost
      encoding: utf8
