---
layout: post
title: The power behind the blog
date: 2005-07-31 09:06:03 +01:00
categories:
- Meta
---
It's probably plainly obvious that the main software powering this beastie is WordPress.  But I thought I'd give a mention to all the other bits and pieces I'm using (or planning to use) to make my blogging life complete:

<ul>
<li><a href="http://www.chroder.com/archives/2005/04/16/wordpress-codehighlight-plugin/">CodeHighlight</a> for doing automatic syntax highlighting of anything I mark up as being 'code'.  This should be most excellent for posting up wee code snippets now and again.</li>
<li><a href="http://www.huddledmasses.org/">Acronym replacer</a> which, FYI, spots when I've used an acronym and wraps it in an
{% highlight xml %}
<acronym title="expansion">TLA</acronym>
{% endhighlight %}
tag.  The result of which is that, when you hover over the acronym in your browser, a tooltip will pop up explaining what it means.</li>
<li><a href="http://rawlinson.us/blog/?p=212">RSS Fetched Link List</a> for automatically retrieving my latest posts from <a href="http://del.icio.us/mathie/">my del.icio.us</a>.</li>
<li><a href="http://www.rockschtar.de/wp-plugin-sh-autolink/">sh-autolink</a> for automatically turning particular keywords into links.  I'm not sure I like this one, yet.  The one modification I've already made is to replace the 'target' field with 'title'.  I strongly dislike the use of target="_blank" -- it's up to <strong>me</strong>, as the browser of a page, whether I want to open up a new window (or tab!), not the designer of the web site!  But anyway, it's a bit cack-handed about replacing stuff (like things that are already enclosed in an anchor tag), so it at least needs tweaking before I'll be happy with it.</li>
<li><a href="http://boneill.ninjagrapefruit.com/wp-tag-plugin/">Technorati Tagging</a> for adding tags to all my posts and displaying the most often used tags in a neat way in the sidebar.</li>
<li><a href="http://manalang.com/archives/2004/06/23/wordpress-plugin-wp-amazon">wp-amazon</a>, which will be really neat after I've gotten it working.  So far, however, the link for adding an Amazon item, well, isn't where it should be.  I can't find it anywhere on the 'write post' page...  I'll persevere.</li>
</ul>

I'm sure I'll go hunting for more plug-ins soon.  In particular, I'll be looking for something to integrate wp with <a href="http://gallery.sf.net/" title="Gallery's home page">Gallery 2</a> soon.
