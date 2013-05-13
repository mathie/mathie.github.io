---
layout: post
title: Breaking-non-space
date: 2005-08-17 18:22:23 +01:00
categories:
- Geekery
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
    other good UAs.</p>


    <p>&#8203; works for Mozilla, but in IE you get the ugly character not found box.</p>


    <p>This page (http://www.fjordaan.uklinux.net/entities/entities_invisible.html)
    has a good chart of space entities ("space entities" sounds much more interesting
    than it is)</p>


    <p>While your CSS suggestion is interesting, I think there''s a lot of room for
    catastrophic hack breaking that would occur :)</p>


    <p>There''s always hope for <a href="http://www.w3.org/TR/2002/WD-css3-text-20021024/#wrap-option-prop"
    rel="nofollow"><code>wrap-option</code></a> support in the future.</p>'
---
I'd never really thought about this before today, but I would like something in XHTML that I could use to hint to a user agent where I consider to be appropriate line breaking points.  Take the example a couple of posts ago, where I had some long paths.  When I put those inline, they ran off the 'post' section of the page onto the right hand column.  The reason for that was they were, as far as Mozilla was concerned, a single word and could not be broken up.  What I'd like to be able to do is indicate what characters should be considered word boundaries and acceptable to wrap on.  In the case of a path, I think it would be acceptable to wrap on a '/' character.  (Some might not think so, though, so it should probably be a semantically marked up thing that can be overridden by a client preference...)  But unfortunately, while there's a way to say '<em>don't</em> break on this space' (<code>&amp;nbsp;</code>), I don't know of a way to express what I'm looking for.

I had wondered if there would be an entity that would do the job and had a look at the <a href="http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters">special characters</a> entities in XHTML 1.0.  <code>&amp;thinsp;</code> (thin space) sounded vaguely promising, but produced very wide spaces all the same.  <code>&amp;zwnj;</code> (or <code>&amp;zwj;</code>?) sounded just the ticket, but it didn't actually work in Firefox and I subsequently discovered that it seems to be for <a href="http://students.washington.edu/irina/persianword/zwj.htm">modifying characters that stand alone</a> in Persian script.

Thinking about it now, something along the lines of the following would work nicely:

[code lang="xml"]<code style="acceptable-linebreak-chars: /.-;">
  /path/to/file.txt
</code>[/code]

Of course, in real life, you'd factor that style out into a stylesheet and instead maybe just have <code>&lt;code class="path"&gt;...</code>  And that way people could override it easily in their clients, if they didn't like what I supplied.

So how does one go about lobbying the <a href="http://www.w3.org/" title="World Wide Web Consortium">W3C</a> for getting stuff included in the next edition of CSS? :-)
