---
layout: post
title: This is a table header!
date: 2005-08-10 16:52:40 +01:00
categories:
- Geekery
- Work
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
