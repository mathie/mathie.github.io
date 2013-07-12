---
layout: post
title: Mapping MailManager to Atom
excerpt: ! "I'm working on adding Atom (and RSS) support to MailManager and I'm trying
  to work out how to map various entities back and forth.  This is mostly for my own
  reference as I go to implement it, but I figured I might as well share it with other
  people, for two reasons:\n\n<ul>\n  <li>Sanity checking my ideas.</li>\n  <li>An
  example of how to map an application that predates (popular) syndication to support
  RSS and Atom.</li>\n</ul>\n\nI'll cut it away from general view since it's probably
  not of interest to most of the readers here; click below if you'd like to read.\n"
date: 2005-10-10 17:56:03 +01:00
categories:
- Geekery
- Python
- Work
---
I'm working on adding Atom (and RSS) support to MailManager and I'm trying to work out how to map various entities back and forth.  This is mostly for my own reference as I go to implement it, but I figured I might as well share it with other people, for two reasons:

<ul>
  <li>Sanity checking my ideas.</li>
  <li>An example of how to map an application that predates (popular) syndication to support RSS and Atom.</li>
</ul>

I'll cut it away from general view since it's probably not of interest to most of the readers here; click below if you'd like to read.

<strong>I apologise in advance for the really poor formatting of the (large) tables below!</strong>

There are two parts to the mapping: information pushed into the feed itself, and data for each of the entries.  In addition, there are generic constructs.

<h3>Content Types</h3>
I know that atom does support specifying the content type as an attribute to most elements, as "text", "html" or "xhtml".  For the first iteration of the atom support in MailManager, all the types can be expressed as plain text.  Perhaps a future iteration will allow for message bodies to show up in HTML.

<h3>Person Constructs</h3>
The <code>person</code> construct in atom maps to a combination of <code>from_name</code> and <code>from_email</code> as this example shows:

{% highlight xml %}
<atom:author>
  <atom:name tal:content="from_name">Graeme Mathieson</atom:name>
  <atom:email tal:content="from_email">mathie@woss.name</atom:email>
</atom:author>
{% endhighlight %}

<h3>Date Constructs</h3>
All date times stored by MailManager are in UTC.  So all dates will be specified in the format:

{% highlight xml %}
<atom:updated>2005-04-05T12:34:56+00:00</atom:updated>
{% endhighlight %}

<h3>Feed data</h3>
<table>
  <thead>
    <tr>
      <td>Atom element</td>
      <td>Equivalent MailManager attribute</td>
      <td>Notes</td>
    </tr>
  </thead>
  <tbody>
  <tr>
<td>title</td>
<td><code>MailManager.title</code></td>
<td>Dead easy, there's a title that's filled in when you create a new MailManager instance.</td>
</tr>
<tr>
<td>author</td>
<td><code>MailManager.admin_username</code> and <code>MailManager.admin_email</code></td>
<td>Person construct with the name of the manager account.  I wonder if this ought to be the first result of <code>MailManager.sql.listUsers(settings=True)</code> instead?  Does <code>admin_username</code> &amp; <code>admin_email</code> actually hang around in the MM object?  Oh, bother, no, they're deleted in <code>manage_afterAdd</code>.</td>
</tr>
<tr>
<td>category</td>
<td></td>
<td>Should we list all the wotsits in category0?  Need to look at the category stuff in more detail later.</td>
</tr>
<tr>
<td>contributor</td>
<td></td>
<td>Not applicable?  Or should it perhaps be populated with person constructs from MailManager.sql.listUsers()?</td>
</tr>
<tr>
<td>generator</td>
<td>n/a</td>
<td>This is a constant: Logicalware MailManager</td>
</tr>
<tr>
<td>icon</td>
<td><code>${here/getBaseURL}/images/favicon.ico</code></td>
<td>Dead easy, straight copy of the existing link in the master template.</td>
</tr>
<tr>
<td>logo</td>
<td><code>${here/getBaseURL}/images/logo_lp.gif</code></td>
<td>Likewise dead easy.  Handy to bung in, though, since when we allow skinning later, that can be changed for a corporate logo.  'til then it's good advertising. :-)</td>
</tr>
<tr>
<td>id</td>
<td></td>
<td>Not sure what this should map to.  It supposed to be something that uniquely identifies the MM instance, even if the URI changes.  The atom feed <strong>MUST</strong> contain one of these.</td>
</tr>
<tr>
<td>link (rel="self")</td>
<td><code>${here/getBaseURL}/feeds/atom</code></td>
<td>Link to the canonical URL for the atom feed</td>
</tr>
<tr>
<td>link (rel=alternate)</td>
<td>For type="text/html", <code>${here/getBaseURL}</code>.  For type="application/rss+xml", <code>${here/getBaseURL}/feeds/rss</code></td>
<td>Links to alternative versions of the same information.</td>
</tr>
<tr>
<td>rights</td>
<td></td>
<td>Not applicable, I don't think.  Possibly it should return a constant from a <code>MailManger.rights</code> property that the admin can customise?  Defaults to 'All Rights Reserved' or the localised equivalent?</td>
</tr>
<tr>
<td>subtitle</td>
<td></td>
<td>Again, I don't think this is applicable?</td>
</tr>
<tr>
<td>updated</td>
<td></td>
<td>When the feed last changed.  This should be the last modified time of the most recently updated ticket.  Not quite sure what to do about this one yet.</td>
</tr>
</tbody>
</table>

<h3>Entry data</h3>
<table>
  <thead>
    <tr>
      <td>Atom element</td>
      <td>Equivalent MailManager attribute</td>
      <td>Notes</td>
    </tr>
  </thead>
  <tbody>
<tr>
<td>author</td>
<td><code>Ticket.from_email</code> and <code>Ticket.from_name</code></td>
<td>The person who initially opened the ticket.</td>
</tr>
<tr>
<td>category</td>
<td><code>Ticket.status</code></td>
<td>The current status of the ticket.  Since you can have 0..\* categories per atom entry, perhaps we should have one for status, and for each of category0..2?  How about one for specifying the account the message came from?  How are categories actually shown in feed agents?</td>
</tr>
<tr>
<td>content</td>
<td></td>
<td>Should we show some content?  Just a summary?  The latest message?  All the messages in the ticket?</td>
</tr>
<tr>
<td>contributor</td>
<td><code>[msg.from_email, msg.from_name for msg in self.sql.listMessages (message_id = Ticket.message_id)]</code></td>
<td>Or something along those lines...  Basically a list of all the unique contributors to the ticket.</td>
</tr>
<tr>
<td>id</td>
<td></td>
<td>Again, not sure about that.  Some concatenation of the tid and the MailManager instance's id.</td>
</tr>
<tr>
<td>link (rel=alternate)</td>
<td></td>
<td>Pointer to the HTML version.</td>
</tr>
<tr>
<td>link (rel=reply)</td>
<td></td>
<td>Just a thought ... perhaps provide a link which might be usable by some agents as something to send a reply.  Maybe not, since the reply form is on the main ticket screen anyway.  But maybe there should be rel=close or rel=spam with links to immediately close, or mark as spam, respectively?</td>
</tr>
<tr>
<td>published</td>
<td><code>Ticket.date_opened</code></td>
<td>When the ticket was first opened.</td>
</tr>
<tr>
<td>rights</td>
<td>n/a</td>
<td>I don't think this is relevant?</td>
</tr>
<tr>
<td>source</td>
<td>n/a</td>
<td>Don't think this is relevant either?</td>
</tr>
<tr>
<td>summary</td>
<td></td>
<td>Maybe this should be something like the ticket details box on ticket_index_html.zpt?  Listing the ticket id, Subject, assigned, status, priority, categories, support of, supporters &amp; respond by?  That way, even if the feed reader doesn't do anything useful with all the meta data we're supplying, it'll still be there in a visible format.</td>
</tr>
<tr>
<td>title</td>
<td><code>Ticket.subject</code></td>
<td></td>
</tr>
<tr>
<td>updated</td>
<td></td>
<td>When the ticket was last updated.</td>
</tr>

</tbody>
</table>

<h3>Additional random notes</h3>

Not something for the first iteration, but we could supply the original messages of a ticket, or the attachments, as an enclosure.

Does any of this make sense?

Comments?
