---
layout: post
title: Opening files in TextMate from less(1)
date: 2005-09-28 17:20:48 +01:00
categories:
- Geekery
---
A quick <a href="http://macromates.com/">TextMate</a> trick, inspired from reading <a href="http://macromates.com/blog/archives/2005/09/28/html-output-for-commands/">HTML output for commands</a> (in particular the section on hyperlinking back to TextMate), I came up with the following:

{% highlight bash %}
export LESSEDIT='open txmt\://open\?url=file\:///`pwd`/%f?lm\\&line=%lm.'
{% endhighlight %}

Add that to your <code>~/.bashrc</code> (or whatever) and, when you view a file in <code>less(1)</code>, then hit <code>v</code> to edit the file, it will bring it up in TextMate <em>at approximately the right line</em>, just as it used to do when you had <code>$VISUAL</code> set to <code>vim</code>.  It doesn't get the line exactly right -- it picks the middle of the screen you're currently looking at, but at least it gets nearer the context you've just decided you want to edit.
