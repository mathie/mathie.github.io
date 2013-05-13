---
layout: post
status: publish
published: true
title: This is a table header!
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 43
wordpress_url: http://woss.name/?p=43
date: 2005-08-10 16:52:40.000000000 +01:00
categories:
- Geekery
- Work
tags: []
comments:
- id: 37
  author: OliverBrown.me.uk
  author_email: ''
  author_url: http://www.oliverbrown.me.uk/2005/08/12/start-semantics-simply/
  date: !binary |-
    MjAwNS0wOC0xMyAwMDo0Mzo0MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0xMiAyMzo0Mzo0MSArMDEwMA==
  content: ! '<strong>Start semantics simply<&#47;strong>


    Shouldn''t you really use <th>s inside the <thead>? Although I doubt it makes
    any difference. Pedanticness aside, I really wish more people knew what HTML tags
    mean (I''ve seen <p class="header"> before :o )...'
- id: 38
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0wOC0xMyAwODoxMDoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0xMyAwNzoxMDoyMiArMDEwMA==
  content: ! 'You''re absolutely right, I should be.  And at least in the HTML I''m
    working on, I did get it right, just forgot to update things when I copy''n''pasted
    from the first example to the second...  I''ll fix it just now.


    I should probably write a similar rant about some of the other HTML in there:


    <pre><tr><td class="header">Title<&#47;td><&#47;tr>

    <tr><td> &amp;nbsp;<&#47;td><&#47;tr>

    <tr><td class="paragraph">Help text<&#47;td><&#47;tr>

    ...<&#47;pre>


    This was for all the  help pages.  I''m assuming the ''blank'' table row was meant
    as leading after the header.  Argh!'
---
I'm never sure whether to laugh or cry every time I see this bit of markup (and it's rather a lot, since it's pervasive in the code I'm <del>fixing<&#47;del> editing just now):

[code lang="xml"]<table>
  <tr class="table_head">
    <td>Header 1<&#47;td>
    <td>Header 2<&#47;td>
    <td>Header 3<&#47;td>
    <td>Header 4<&#47;td>
  <&#47;tr>
   ...
<&#47;table>[&#47;code]

(example simplified to protect the guilty!)  Did you know that there is an HTML tag (and has been since HTML 4) that allows you to specify that it's a table header in a standard way?  It's called <code><thead><&#47;code>.  So we can instead do:

[code lang="xml"]<table>
  <thead>
    <tr>
      <th>Header 1<&#47;th>
      <th>Header 2<&#47;th>
      <th>Header 3<&#47;th>
      <th>Header 4<&#47;th>
    <&#47;tr>
  <&#47;thead>
  <tbody>
    ...
  <&#47;tbody>
<&#47;table>[&#47;code]

to get the same effect.  Not only that, the browser can then make 'intelligent' use of the header row.  For example, it can repeat the header on pages of printed media where the table is on more than a single page.  Screen readers can allow a greater understanding of the table elements.  CSS weenies can do magic things to anything inside a <code><thead><&#47;code> element to make them look like headings.  And text-only browsers (that are pretty much going to ignore those fancy header styles you've applied anyway) can still render things in such a way as to make clear that they're headers.  This, boys and girls, is what's called <em>"sematic markup"<&#47;em>.  We give text <em>meaning<&#47;em> by the tags placed around them.  (BTW, <code><tfoot><&#47;code> also exists, but I've found less practical use for that so far -- maybe it's good for doing totals fields in a spreadsheet-like thing or something...)

<strong>Update<&#47;strong> Replaced the <code><td><&#47;code>s in the second example with <code><th><&#47;code>s which is more correct.  If one is going to be pedantic, one may as well actually get things right...
