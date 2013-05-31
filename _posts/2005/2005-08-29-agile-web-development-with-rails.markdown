---
layout: post
title: Agile Web Development with Rails
date: 2005-08-29 09:06:47 +01:00
categories:
- Entertainment
- Geekery
- Python
---
<a href="http://www.amazon.co.uk/exec/obidos/ASIN/097669400X/mathieoftheen-21"><img src="http://images-eu.amazon.com/images/P/097669400X.02._SCMZZZZZZZ_.jpg" alt="Cover of Agile Web Development with Rails" class="alignright" /></a> Annabel and I spent Saturday afternoon in Borders, perusing the book stacks and drinking coffee.  One of the books I picked up, that I've been reading ever since, is [Agile Web Development with Rails](http://www.amazon.co.uk/exec/obidos/ASIN/097669400X/mathieoftheen-21), part of the [Pragmatic Programmer](http://www.pragmaticprogrammer.com/) series.

Now I'm not particularly sure about [Ruby](http://www.ruby-lang.org/).  I've not had much exposure to it, but somehow I find it aesthetically displeasing.  Not a huge snub for a programming language, I'll grant you (and I admit it, I was wrong about Python, complaining about the use of significant whitespace for years!) but it has put me off putting any effort into learning it.  On the other hand, the most important part of programming, from a platform-choice point of view, really has to be the framework rather than the language itself.  The language is mere syntax, the framework gives you the power to actually express ideas easily (or not so easily in some cases).

But so far, I'm thinking 'wow'.  In particular, I can see being able to express all the concepts of [MailManager](http://www.logicalware.com/) as being really easy.  The framework already has all the right 'bits', in a sensible manner.  There's actually a level of abstraction to the backend database types through the ActiveRecord ORM (something Kev, who's just ported MailManager from Postgres to MySQL will appreciate!).  The framework has support for dealing with email (incoming and outgoing).  Functional, and unit, testing is built in.  It utilises the MVC idiom nicely to separate out view-related code from the model itself.

I should point out that [Zope](http://zope.org/) (particularly the v3 strand) does have all these features too, but [Rails](http://rubyonrails.org/) just seems somehow more <em>elegant</em>.

One of the other major facets of the book (and of the Rails system) is of Agile Programming.  It's getting things done quickly, in small iterations, so that the customer can become more involved in the direction of the product.  Rails facilitates this nicely by providing scaffolding code -- a very basic implementation which will display tabular data, allowing you to add, edit and remove records -- from which you can evolve your application.  So far, following through the book, I have an online 'shop'.  So far, it doesn't do much, but there's a fully functional admin interface for managing the product catalogue.  We started with just the scaffold, then added validation, then made the page look pretty.  Each of these steps had a 'deliverable' at the end which the customer could see.

Well, it's said that, to keep oneself in tip-top coding condition, one should learn a new language every year.  This year, it looks like it's going to be Ruby!
