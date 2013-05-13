---
layout: post
title: Page templates, macros and slots
date: 2005-08-11 11:45:43 +01:00
categories:
- Geekery
- Python
- Work
---
I'm just writing this down so I get it clear in my head, so I can be consistent when I'm writing this code.  From playing around with it this morning, I've noticed the following rules with respect to METAL macros, slots and how they interact to produce the final HTML page:

<ul>
<li>The tag with the attribute <code>metal:define-slot</code> is <em>replaced</em> (ie the tag and its content is removed and replaced) by the tag with the matching <code>metal:define-slot</code>.</li>
<li>Therefore, any attributes alongside a <code>metal:define-slot</code> are <em>discarded</em> when its tag is replaced.</li>
</ul>

So, doing the following:

{% highlight xml %}
...
<div id="subnav" metal:define-slot="subnav_menu">
  Insert second-level menu here
</div>
...
<div metal:fill-slot="subnav_menu">
  <ul>
    <li>First link</li>
    <li>Second link</li>
    <li>Third link</li>
  </ul>
</div>
{% endhighlight %}

will produce the following HTML:

{% highlight xml %}
...
<div>
  <ul>
    <li>First link</li>
    <li>Second link</li>
    <li>Third link</li>
  </ul>
</div>
{% endhighlight %}

Note the missing <code>id</code> attribute.  In order to do what I actually want to achieve, which is to label the subnav menu -- that will be different in different templates -- with the id 'subnav', I need to do one of two options:

{% highlight xml %}
...
<div metal:define-slot="subnav_menu">
  Insert second-level menu here
</div>
...
<div id="subnav" metal:fill-slot="subnav_menu">
  <ul>
    <li>First link</li>
    <li>Second link</li>
    <li>Third link</li>
  </ul>
</div>
{% endhighlight %}

or

{% highlight xml %}
...
<div id="subnav">
  <div metal:define-slot="subnav_menu">
    Insert second-level menu here
  </div>
</div>
...
<div metal:fill-slot="subnav_menu" tal:omit-tag="">
  <ul>
    <li>First link</li>
    <li>Second link</li>
    <li>Third link</li>
  </ul>
</div>
{% endhighlight %}

The second is more verbose, but I think I also prefer it, since that way there's less repetition.  Say I want to rename the 'subnav' id to something else because it clashes with another application that MailManager gets embedded in -- would I rather change it in two places or twenty?  Now I just need to go back through my code and make sure I'm doing this consistently!

<strong>Update</strong> Or I could refine the second example a little more to remove the tag omission.  Duh:

{% highlight xml %}
...
<div id="subnav">
  <div metal:define-slot="subnav_menu">
    Insert second-level menu here
  </div>
</div>
...
<ul metal:fill-slot="subnav_menu">
  <li>First link</li>
  <li>Second link</li>
  <li>Third link</li>
</ul>
{% endhighlight %}
