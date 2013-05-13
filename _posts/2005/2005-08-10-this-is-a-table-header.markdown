---
layout: post
status: publish
published: true
title: This is a table header!
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
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
  content: ! '<strong>Start semantics simply</strong>


    Shouldn''t you really use &lt;th&gt;s inside the &lt;thead&gt;? Although I doubt
    it makes any difference. Pedanticness aside, I really wish more people knew what
    HTML tags mean (I''ve seen &lt;p class="header"&gt; before :o )...'
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


    <pre>&lt;tr&gt;&lt;td class="header"&gt;Title&lt;/td&gt;&lt;/tr&gt;

    &lt;tr&gt;&lt;td&gt; &amp;nbsp;&lt;/td&gt;&lt;/tr&gt;

    &lt;tr&gt;&lt;td class="paragraph"&gt;Help text&lt;/td&gt;&lt;/tr&gt;

    ...</pre>


    This was for all the  help pages.  I''m assuming the ''blank'' table row was meant
    as leading after the header.  Argh!'
---
I'm never sure whether to laugh or cry every time I see this bit of markup (and it's rather a lot, since it's pervasive in the code I'm <del>fixing</del> editing just now):

[code lang="xml"]<table>
  <tr class="table_head">
    <td>Header 1</td>
    <td>Header 2</td>
    <td>Header 3</td>
    <td>Header 4</td>
  </tr>
   ...
</table>[/code]

(example simplified to protect the guilty!)  Did you know that there is an HTML tag (and has been since HTML 4) that allows you to specify that it's a table header in a standard way?  It's called <code>&lt;thead&gt;</code>.  So we can instead do:

[code lang="xml"]<table>
  <thead>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
      <th>Header 3</th>
      <th>Header 4</th>
    </tr>
  </thead>
  <tbody>
    ...
  </tbody>
</table>[/code]

to get the same effect.  Not only that, the browser can then make 'intelligent' use of the header row.  For example, it can repeat the header on pages of printed media where the table is on more than a single page.  Screen readers can allow a greater understanding of the table elements.  CSS weenies can do magic things to anything inside a <code>&lt;thead&gt;</code> element to make them look like headings.  And text-only browsers (that are pretty much going to ignore those fancy header styles you've applied anyway) can still render things in such a way as to make clear that they're headers.  This, boys and girls, is what's called <em>"sematic markup"</em>.  We give text <em>meaning</em> by the tags placed around them.  (BTW, <code>&lt;tfoot&gt;</code> also exists, but I've found less practical use for that so far -- maybe it's good for doing totals fields in a spreadsheet-like thing or something...)

<strong>Update</strong> Replaced the <code>&lt;td&gt;</code>s in the second example with <code>&lt;th&gt;</code>s which is more correct.  If one is going to be pedantic, one may as well actually get things right...
