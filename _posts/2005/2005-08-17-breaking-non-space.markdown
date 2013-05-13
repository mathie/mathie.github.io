---
layout: post
title: Breaking-non-space
date: 2005-08-17 18:22:23 +01:00
categories:
- Geekery
---
I'd never really thought about this before today, but I would like something in XHTML that I could use to hint to a user agent where I consider to be appropriate line breaking points.  Take the example a couple of posts ago, where I had some long paths.  When I put those inline, they ran off the 'post' section of the page onto the right hand column.  The reason for that was they were, as far as Mozilla was concerned, a single word and could not be broken up.  What I'd like to be able to do is indicate what characters should be considered word boundaries and acceptable to wrap on.  In the case of a path, I think it would be acceptable to wrap on a '/' character.  (Some might not think so, though, so it should probably be a semantically marked up thing that can be overridden by a client preference...)  But unfortunately, while there's a way to say '<em>don't</em> break on this space' (<code>&amp;nbsp;</code>), I don't know of a way to express what I'm looking for.

I had wondered if there would be an entity that would do the job and had a look at the <a href="http://www.w3.org/TR/xhtml1/dtds.html#a_dtd_Special_characters">special characters</a> entities in XHTML 1.0.  <code>&amp;thinsp;</code> (thin space) sounded vaguely promising, but produced very wide spaces all the same.  <code>&amp;zwnj;</code> (or <code>&amp;zwj;</code>?) sounded just the ticket, but it didn't actually work in Firefox and I subsequently discovered that it seems to be for <a href="http://students.washington.edu/irina/persianword/zwj.htm">modifying characters that stand alone</a> in Persian script.

Thinking about it now, something along the lines of the following would work nicely:

{% highlight xml %}
<code style="acceptable-linebreak-chars: /.-;">
  /path/to/file.txt
</code>
{% endhighlight %}

Of course, in real life, you'd factor that style out into a stylesheet and instead maybe just have <code>&lt;code class="path"&gt;...</code>  And that way people could override it easily in their clients, if they didn't like what I supplied.

So how does one go about lobbying the <a href="http://www.w3.org/" title="World Wide Web Consortium">W3C</a> for getting stuff included in the next edition of CSS? :-)
