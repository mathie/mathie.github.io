---
layout: post
status: publish
published: true
title: Models, Views &amp; Controllers
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 107
wordpress_url: http://woss.name/?p=107
date: 2005-09-08 09:35:46.000000000 +01:00
categories:
- Geekery
tags: []
comments: []
---
I guess I need to re-read more detail on the <acronym title="Model View Controller">MVC<&#47;acronym> split.  It's obvious to me what the model is -- that's the interface to the underlying data, and it's almost always going to refer to a noun.  'Book', for example, for stuff I was messing around with last night &amp; this morning.  But when it came to the View&#47;Controller split, I'm getting a bit confused.  I'd done:

[code]script&#47;generate scaffold Book Admin[&#47;code]

to create an admin interface for adding, removing and editing books.  The book refers to 'Admin' as being a controller.  But while I was writing the svn commit message, I mentioned it as a view, since clearly it was the 'administrative' view on the 'Book' model.  I'm probably just confused, though, so I guess I need to refresh my memory...

FWIW, notes of what I've been fiddling with are available in <a href="http:&#47;&#47;woss.name&#47;svn&#47;mathie&#47;projects&#47;library&#47;trunk&#47;doc&#47;README_FOR_APP">projects&#47;library&#47;trunk&#47;doc&#47;README_FOR_APP<&#47;a> in my svn repository.
