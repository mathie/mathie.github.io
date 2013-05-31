---
layout: post
title: Mucking around with Typo
date: 2005-11-16 08:47:02 +00:00
categories:
- Geekery
- Meta
---
I've been having a play around with [Typo](http://typo.leetsoft.com/), which is web log software (the equivalent of [Wordpress](http://wordpress.org/) that I'm using just now) written in [Ruby on Rails](http://www.rubyonrails.com/).  It has some really slick features -- particularly with the use of AJAX on the client side for a more 'impressive' browsing experience.  (Just try adding a comment, and watch it slide into the existing comments as it performs an <code>XmlHttpRequest()</code> to submit the comment, then insert it into the existing page!)  It defintiely has potential, but there's some work I'd need to do before even considering migrating this site across to it:

<ul>
  <li>Figure out some automatic migration of the existing articles and static pages, including my existing tags and categories.</li>
  <li>Fiddle the routing so that WP-style URLs will still work.  I rather like how my content turns up in [Google](http://www.google.com/) already, thank you.</li>
  <li>Put in proper [Technorati](http://www.technorati.com/) tags into the post (currently they link to the local tag list, but I think to be recognised by Technorati, they have to point to <code>http://www.technorati.com/tag/tag_name</code>).</li>
  <li>Split tags by ',' rather than a space character.  I sometimes have multiple words in my tags.</li>
  <li>Put together something for automagically doing [Creative Commons](http://www.creativecommons.org/) licensing.</li>
  <li>Rejoice at no longer having to occasionally look at PHP code!</li>
</ul>

If nothing else, reading through the code has been a reminder of just how <em>cool</em> [Rails](http://www.rubyonrails.com/) is!
