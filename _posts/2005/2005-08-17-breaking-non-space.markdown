---
layout: post
status: publish
published: true
title: Breaking-non-space
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 59
wordpress_url: http://woss.name/?p=59
date: 2005-08-17 18:22:23.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 48
  author: Alden Bates
  author_email: aldenbates@yahoo.co.uk
  author_url: http://abates.tetrap.com/
  date: !binary |-
    MjAwNS0xMC0zMCAwMzozNjoxOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0zMCAwMjozNjoxOSArMDAwMA==
  content: ! 'I can''t believe they didn''t put something in to make a breaking non-space!  I''m
    currently converting my web site from HTML to XHTML, and some of the changes I''m
    having to make are silly...


    I thought I''d fixed it by using a hyphen, but while Internet Explorer breaks
    on a hyphen, FireFox doesn''t, so that went out the window. :('
- id: 49
  author: Josh Peters
  author_email: jcpeters@gmail.com
  author_url: http://josh-peters.name/blog
  date: !binary |-
    MjAwNi0wNC0xOSAyMzoxNDo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0xOSAyMjoxNDo1NyArMDEwMA==
  content: ! '<p>Try using entity &#8203; if you only care about Mozilla, Opera, and
    other good UAs.<&#47;p>


    <p>&#8203; works for Mozilla, but in IE you get the ugly character not found box.<&#47;p>


    <p>This page (http:&#47;&#47;www.fjordaan.uklinux.net&#47;entities&#47;entities_invisible.html)
    has a good chart of space entities ("space entities" sounds much more interesting
    than it is)<&#47;p>


    <p>While your CSS suggestion is interesting, I think there''s a lot of room for
    catastrophic hack breaking that would occur :)<&#47;p>


    <p>There''s always hope for <a href="http:&#47;&#47;www.w3.org&#47;TR&#47;2002&#47;WD-css3-text-20021024&#47;#wrap-option-prop"
    rel="nofollow"><code>wrap-option<&#47;code><&#47;a> support in the future.<&#47;p>'
---
I'd never really thought about this before today, but I would like something in XHTML that I could use to hint to a user agent where I consider to be appropriate line breaking points.  Take the example a couple of posts ago, where I had some long paths.  When I put those inline, they ran off the 'post' section of the page onto the right hand column.  The reason for that was they were, as far as Mozilla was concerned, a single word and could not be broken up.  What I'd like to be able to do is indicate what characters should be considered word boundaries and acceptable to wrap on.  In the case of a path, I think it would be acceptable to wrap on a '&#47;' character.  (Some might not think so, though, so it should probably be a semantically marked up thing that can be overridden by a client preference...)  But unfortunately, while there's a way to say '<em>don't<&#47;em> break on this space' (<code>&amp;nbsp;<&#47;code>), I don't know of a way to express what I'm looking for.

I had wondered if there would be an entity that would do the job and had a look at the <a href="http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml1&#47;dtds.html#a_dtd_Special_characters">special characters<&#47;a> entities in XHTML 1.0.  <code>&amp;thinsp;<&#47;code> (thin space) sounded vaguely promising, but produced very wide spaces all the same.  <code>&amp;zwnj;<&#47;code> (or <code>&amp;zwj;<&#47;code>?) sounded just the ticket, but it didn't actually work in Firefox and I subsequently discovered that it seems to be for <a href="http:&#47;&#47;students.washington.edu&#47;irina&#47;persianword&#47;zwj.htm">modifying characters that stand alone<&#47;a> in Persian script.

Thinking about it now, something along the lines of the following would work nicely:

[code lang="xml"]<code style="acceptable-linebreak-chars: &#47;.-;">
  &#47;path&#47;to&#47;file.txt
<&#47;code>[&#47;code]

Of course, in real life, you'd factor that style out into a stylesheet and instead maybe just have <code><code class="path">...<&#47;code>  And that way people could override it easily in their clients, if they didn't like what I supplied.

So how does one go about lobbying the <a href="http:&#47;&#47;www.w3.org&#47;" title="World Wide Web Consortium">W3C<&#47;a> for getting stuff included in the next edition of CSS? :-)
