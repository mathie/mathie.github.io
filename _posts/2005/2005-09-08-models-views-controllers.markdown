---
layout: post
title: Models, Views &amp; Controllers
date: 2005-09-08 09:35:46 +01:00
categories:
- Geekery
---
I guess I need to re-read more detail on the <acronym title="Model View Controller">MVC</acronym> split.  It's obvious to me what the model is -- that's the interface to the underlying data, and it's almost always going to refer to a noun.  'Book', for example, for stuff I was messing around with last night &amp; this morning.  But when it came to the View/Controller split, I'm getting a bit confused.  I'd done:

{% highlight bash %}
script/generate scaffold Book Admin
{% endhighlight %}

to create an admin interface for adding, removing and editing books.  The book refers to 'Admin' as being a controller.  But while I was writing the svn commit message, I mentioned it as a view, since clearly it was the 'administrative' view on the 'Book' model.  I'm probably just confused, though, so I guess I need to refresh my memory...

FWIW, notes of what I've been fiddling with are available in [projects/library/trunk/doc/README_FOR_APP](http://woss.name/svn/mathie/projects/library/trunk/doc/README_FOR_APP) in my svn repository.
