---
title: Marking up an Article
subtitle: Supplying metadata to keep the robots happy
category: Programming
tags:
  - microdata
  - opengraph
  - facebook
  - twitter
  - google
  - search
---

One of the key advantages to HyperText Markup Language (HTML) -- the language
used to mark up the majority of the content you read on the web -- is that it
allows us to attach semantic meaning to the words we write. While this can
often be useful for formatting the content, it can also be used to extract that
meaning automatically from the words.

For example, if I structure an article so that it has a series of headings,
from `<h1>` for the main title, through to `<h6>` for a chapter's
sub-sub-section, then I could have a lump of JavaScript code which would
extract these headings and automatically generate a table of contents.[^1] With
[HTML5][] we have an even richer vocabulary to give semantic meaning to our
words, so with HTML tags, we can mark up things like articles, sections, header
groups, figures, and captions. The more meaning we specify about our words, the
more that computers can automatically interpret that meaning and provide a
richer experience around those words. HTML 5 is, as of October 2014, now the
recommended version of HTML for use on the web. (At last!)

In addition to marking up the content itself, we can also provide additional
metadata to help computers get the right information about the article. For
example, if somebody posts a link to Facebook, it's helpful to show the title,
a short description and, perhaps, an associated image for that link. Providing
this information to Facebook (and similarly for Twitter) provides a richer
experience for everyone. If your article shows up in Google's search results,
it's good for Google to be able to show details on the article that are going
to help the user decide whether it answers their search query.

There are a few tools we can use to provide this metadata. Unfortunately, while
most of these tools all do the same sort of thing, they all do it in different
ways, so we need to duplicate content to make sure everyone gets what they need. For the rest of this article, I'll be focusing on four key topics and, in particular, focus on their use in generating meta data for a blog-style article:

* Standard, basic, metadata.

* Facebook's [OpenGraph Protocol](http://ogp.me) metadata.

* [Twitter Cards](https://dev.twitter.com/cards/overview).

* [HTML5 Microdata](https://support.google.com/webmasters/answer/176035?hl=en), used by Google.

Let's have a bit of sample data to work from. The previous article I wrote, on the [HYPER key](/articles/hyperpower/) has the following set of meta data that I've specified in the article source:

{% highlight yaml %}
title: HYPERPOWER!
subtitle: Putting the caps lock key to work
excerpt: |
  Today, we'll figure out how to replace the caps lock key
  with the (far more useful) HYPER key on Mac OS X, and
  have a think about the ways we can put it to use.
category: Ops
tags:
  - hyper
  - capslock
  - Alfred
  - Seil
  - Karabiner
{% endhighlight %}

So, we've got an article title, a short description of the content, a main
category, and a list of tags associated with the article. That, combined with a
little standard information about your intrepid author, should be enough to
provide Facebook, Twitter, and Google with some appropriate meta data.

## Basic Metadata

Since forever, HTML has had a couple of properties that you can set in the
`<head>` of the document to specify some additional metadata. They're so often
abused that it's common knowledge they're ignored by most machines, but since
we're not going to abuse them, there's no harm in making proper use of them.
First, the title tag (which is used to display the title of the page in your
browser, and is often displayed in search results):

    <title>HYPERPOWER! | Notes from a Messy Desk</title>

Since the title shows up in a few places, it's common to stick the web site's
title in there too. Many views truncate the title, so it's a good idea to make
sure the article title is first. Then we have a couple of meta tags with the
description and the tags:

    <meta name="keywords" content="hyper capslock Alfred Seil Karabiner">
    <meta name="description" content="Today, we'll figure out how to...">

(I'll shorten the description from now on, since it gets repeated a few times.
You get the idea, I'm sure.) Finally, we'll specify the canonical URL for the article, which is the One True Resource Location people should link to when they're sharing your article.

    <link rel="canonical" href="https://woss.name/articles/hyperpower/">

This is useful if, say, for example, you have individual pages for each
article, but you also display the latest article on the home page of your site.

That's about it for the basic metadata.

## Facebook OpenGraph

Facebook has its own protocol for specifying metadata about an article. The
protocol is open, and intended to be used by others, but Facebook seems to be
the main consumer. It's based upon
<abbr title="Resource Description Framework in attributes">RDFa</abbr> which, roughly translated, means sticking additional `<meta>` tags in the header of your HTML file.
[^1]: Speaking of which, I would love to automatically generate a table of
      contents for articles on this site, which would stay on screen at the left
      side, highlighting the current selection in some way. I'm sure it can be
      done with Twitter Bootstrap's affix plugin, plus a bit of JS to extract
      the headings, but I've never figured it out. Can you help?

[HTML5]: http://www.w3.org/TR/html5/ "A vocabulary and associated APIs for HTML and XHTML"