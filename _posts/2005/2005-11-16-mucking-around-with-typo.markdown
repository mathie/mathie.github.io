---
layout: post
status: publish
published: true
title: Mucking around with Typo
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 184
wordpress_url: http://woss.name/?p=184
date: 2005-11-16 08:47:02.000000000 +00:00
categories:
- Geekery
- Meta
tags: []
comments:
- id: 212
  author: Blog
  author_email: ''
  author_url: https://zope1.tomster.org/tomster/site/blog/archive/2005/11/17/typo-not-typo
  date: !binary |-
    MjAwNS0xMS0xNyAxMzoxNTo1MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0xNyAxMjoxNTo1MSArMDAwMA==
  content: ! '<strong>Typo, not Typo<&#47;strong>


    From the Looking-over-the-fence-Department'
---
I've been having a play around with <a href="http:&#47;&#47;typo.leetsoft.com&#47;">Typo<&#47;a>, which is web log software (the equivalent of <a href="http:&#47;&#47;wordpress.org&#47;">Wordpress<&#47;a> that I'm using just now) written in <a href="http:&#47;&#47;www.rubyonrails.com&#47;">Ruby on Rails<&#47;a>.  It has some really slick features -- particularly with the use of AJAX on the client side for a more 'impressive' browsing experience.  (Just try adding a comment, and watch it slide into the existing comments as it performs an <code>XmlHttpRequest()<&#47;code> to submit the comment, then insert it into the existing page!)  It defintiely has potential, but there's some work I'd need to do before even considering migrating this site across to it:

<ul>
  <li>Figure out some automatic migration of the existing articles and static pages, including my existing tags and categories.<&#47;li>
  <li>Fiddle the routing so that WP-style URLs will still work.  I rather like how my content turns up in <a href="http:&#47;&#47;www.google.com&#47;" title="The collective mind">Google<&#47;a> already, thank you.<&#47;li>
  <li>Put in proper <a href="http:&#47;&#47;www.technorati.com&#47;">Technorati<&#47;a> tags into the post (currently they link to the local tag list, but I think to be recognised by Technorati, they have to point to <code>http:&#47;&#47;www.technorati.com&#47;tag&#47;tag_name<&#47;code>).<&#47;li>
  <li>Split tags by ',' rather than a space character.  I sometimes have multiple words in my tags.<&#47;li>
  <li>Put together something for automagically doing <a href="http:&#47;&#47;www.creativecommons.org&#47;">Creative Commons<&#47;a> licensing.<&#47;li>
  <li>Rejoice at no longer having to occasionally look at PHP code!<&#47;li>
<&#47;ul>

If nothing else, reading through the code has been a reminder of just how <em>cool<&#47;em> <a href="http:&#47;&#47;www.rubyonrails.com&#47;">Rails<&#47;a> is!
