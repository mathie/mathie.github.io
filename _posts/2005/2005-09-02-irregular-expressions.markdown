---
layout: post
title: Irregular expressions
date: 2005-09-02 11:04:56 +01:00
categories:
- Geekery
- Python
- Work
---
Looking through some sample data for <a href="http://www.logicalware.com/">MailManager</a>, I came across the following:

{% highlight bash %}
r.examplemended
{% endhighlight %}

and thought "that's an odd typo."  Then it dawned on me.  Somebody has gone through the file with the following chunk of sed: <code>s/.com/.example/g</code>, trying to replace email addresses with the <code>.com</code> domain, with <code>.example</code> equivalents.  Unfortunately, the '.' wasn't escaped, so was interpreted as meaning 'any single character', so 'ecom' was replaced by '.example'.  Oops. :-)

And now back to figuring out why it's telling me:

{% highlight bash %}
ERROR: could not find tsearch config by locale
{% endhighlight %}

...
