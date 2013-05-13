---
layout: post
title: Selecting Options with TAL and XHTML
date: 2005-08-29 14:14:00 +01:00
categories:
- Geekery
- Python
- Work
comments:
- id: 86
  author: keith
  author_email: keith.d.pendergrass@us.army.mil
  author_url: http://n/a
  date: !binary |-
    MjAwNi0wNS0yNyAwNDozNzoxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yNyAwMzozNzoxMiArMDEwMA==
  content: ! "<p>I need to get both the description and the index of hte selected
    option and my loop statement with query result is like &gt;&gt;\n</p>\n\n<p>and
    i changed this based upon your code snippet but apparently I am missing something
    because it fails at run-time?</p>\n\n<p>\n        name\n</p>\n\n<p>i'd like the
    selected index, description, and then have this value stay active in the drop
    down list box. Right now it goes back to the last value everytime?</p>"
---
This is another one of these 'notes' that I'm keeping for myself, that I should write up into some <a href="http://www.logicalware.com/" title="MailManager email response management system">MailManager</a> UI documentation.  It all boils down to trying to use consistent idioms throughout the page templates since the old templates clearly demonstrate "There's More Than One Way to Do It", but not necessarily that all those ways wind up with exactly the same output, or are necessarily even correct... :-/

So, when you've got something along the lines of:

[code lang="xml"]<label for="batch_size:int" i18n:translate="number_of_tickets_to_display">Number of tickets to display</label>
<select id="batch_size:int" name="batch_size:int">
  <option tal:repeat="num python:range(10, 105, 5)" tal:attributes="value num" tal:content="num">15</option>
</select><br />[/code]

one of the ways I keep seeing for correctly selecting the current value is to add <code>selected python:num == here.batch_size</code> to the <code>tal:attributes</code> attribute.  The trouble with that is that it produces the following output (snipped slightly for brevity):

[code lang="xml"]<label for="batch_size:int">Number of tickets to display</label>
<select id="batch_size:int" name="batch_size:int">
  <option selected="False" value="10">10</option>
  <option selected="False" value="15">15</option>
  <option selected="False" value="20">20</option>
  <option selected="False" value="25">25</option>
  <option selected="True" value="30">30</option>
  <option selected="False" value="35">35</option>
  <option selected="False" value="40">40</option>
  <option selected="False" value="45">45</option>
  ...
</select><br />[/code]

Note that the value '30' is selected.  However, in my copy of Firefox, it fails to determine which one is actually selected.  This is because simply <em>having</em> the attribute <code>selected</code> is supposed to indicate that it is selected, not that it should evaluate the value in some way.  So it winds up picking the last one out the list.

The correct way (or just <em>my</em> correct way -- there are probably better ones!) to specify which is the selected option is to add <code>selected python:test(num == here.batch_size, 1, None)</code> to the <code>tal:attributes</code> attribute.  That way, in the resulting XHTML, <code>selected</code> will have the value "1" in the option that's currently selected, and will otherwise be omitted.
