---
layout: post
status: publish
published: true
title: Mapping MailManager to Atom
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
excerpt: ! "I'm working on adding Atom (and RSS) support to MailManager and I'm trying
  to work out how to map various entities back and forth.  This is mostly for my own
  reference as I go to implement it, but I figured I might as well share it with other
  people, for two reasons:\n\n<ul>\n  <li>Sanity checking my ideas.<&#47;li>\n  <li>An
  example of how to map an application that predates (popular) syndication to support
  RSS and Atom.<&#47;li>\n<&#47;ul>\n\nI'll cut it away from general view since it's
  probably not of interest to most of the readers here; click below if you'd like
  to read.\n"
wordpress_id: 143
wordpress_url: http://woss.name/?p=143
date: 2005-10-10 17:56:03.000000000 +01:00
categories:
- Geekery
- Python
- Work
tags: []
comments: []
---
I'm working on adding Atom (and RSS) support to MailManager and I'm trying to work out how to map various entities back and forth.  This is mostly for my own reference as I go to implement it, but I figured I might as well share it with other people, for two reasons:

<ul>
  <li>Sanity checking my ideas.<&#47;li>
  <li>An example of how to map an application that predates (popular) syndication to support RSS and Atom.<&#47;li>
<&#47;ul>

I'll cut it away from general view since it's probably not of interest to most of the readers here; click below if you'd like to read.
<a id="more"></a><a id="more-143"></a>

<strong>I apologise in advance for the really poor formatting of the (large) tables below!<&#47;strong>

There are two parts to the mapping: information pushed into the feed itself, and data for each of the entries.  In addition, there are generic constructs.

<h3>Content Types<&#47;h3>
I know that atom does support specifying the content type as an attribute to most elements, as "text", "html" or "xhtml".  For the first iteration of the atom support in MailManager, all the types can be expressed as plain text.  Perhaps a future iteration will allow for message bodies to show up in HTML.

<h3>Person Constructs<&#47;h3>
The <code>person<&#47;code> construct in atom maps to a combination of <code>from_name<&#47;code> and <code>from_email<&#47;code> as this example shows:

[code lang="xml"]<atom:author>
  <atom:name tal:content="from_name">Graeme Mathieson<&#47;atom:name>
  <atom:email tal:content="from_email">mathie@woss.name<&#47;atom:email>
<&#47;atom:author>[&#47;code]

<h3>Date Constructs<&#47;h3>
All date times stored by MailManager are in UTC.  So all dates will be specified in the format:

[code lang="xml"]<atom:updated>2005-04-05T12:34:56+00:00<&#47;atom:updated>[&#47;code]

<h3>Feed data<&#47;h3>
<table>
  <thead>
    <tr>
      <td>Atom element<&#47;td>
      <td>Equivalent MailManager attribute<&#47;td>
      <td>Notes<&#47;td>
    <&#47;tr>
  <&#47;thead>
  <tbody>
  <tr>
<td>title<&#47;td>
<td><code>MailManager.title<&#47;code><&#47;td>
<td>Dead easy, there's a title that's filled in when you create a new MailManager instance.<&#47;td>
<&#47;tr>
<tr>
<td>author<&#47;td>
<td><code>MailManager.admin_username<&#47;code> and <code>MailManager.admin_email<&#47;code><&#47;td>
<td>Person construct with the name of the manager account.  I wonder if this ought to be the first result of <code>MailManager.sql.listUsers(settings=True)<&#47;code> instead?  Does <code>admin_username<&#47;code> &amp; <code>admin_email<&#47;code> actually hang around in the MM object?  Oh, bother, no, they're deleted in <code>manage_afterAdd<&#47;code>.<&#47;td>
<&#47;tr>
<tr>
<td>category<&#47;td>
<td><&#47;td>
<td>Should we list all the wotsits in category0?  Need to look at the category stuff in more detail later.<&#47;td>
<&#47;tr>
<tr>
<td>contributor<&#47;td>
<td><&#47;td>
<td>Not applicable?  Or should it perhaps be populated with person constructs from MailManager.sql.listUsers()?<&#47;td>
<&#47;tr>
<tr>
<td>generator<&#47;td>
<td>n&#47;a<&#47;td>
<td>This is a constant: Logicalware MailManager<&#47;td>
<&#47;tr>
<tr>
<td>icon<&#47;td>
<td><code>${here&#47;getBaseURL}&#47;images&#47;favicon.ico<&#47;code><&#47;td>
<td>Dead easy, straight copy of the existing link in the master template.<&#47;td>
<&#47;tr>
<tr>
<td>logo<&#47;td>
<td><code>${here&#47;getBaseURL}&#47;images&#47;logo_lp.gif<&#47;code><&#47;td>
<td>Likewise dead easy.  Handy to bung in, though, since when we allow skinning later, that can be changed for a corporate logo.  'til then it's good advertising. :-)<&#47;td>
<&#47;tr>
<tr>
<td>id<&#47;td>
<td><&#47;td>
<td>Not sure what this should map to.  It supposed to be something that uniquely identifies the MM instance, even if the URI changes.  The atom feed <strong>MUST<&#47;strong> contain one of these.<&#47;td>
<&#47;tr>
<tr>
<td>link (rel="self")<&#47;td>
<td><code>${here&#47;getBaseURL}&#47;feeds&#47;atom<&#47;code><&#47;td>
<td>Link to the canonical URL for the atom feed<&#47;td>
<&#47;tr>
<tr>
<td>link (rel=alternate)<&#47;td>
<td>For type="text&#47;html", <code>${here&#47;getBaseURL}<&#47;code>.  For type="application&#47;rss+xml", <code>${here&#47;getBaseURL}&#47;feeds&#47;rss<&#47;code><&#47;td>
<td>Links to alternative versions of the same information.<&#47;td>
<&#47;tr>
<tr>
<td>rights<&#47;td>
<td><&#47;td>
<td>Not applicable, I don't think.  Possibly it should return a constant from a <code>MailManger.rights<&#47;code> property that the admin can customise?  Defaults to 'All Rights Reserved' or the localised equivalent?<&#47;td>
<&#47;tr>
<tr>
<td>subtitle<&#47;td>
<td><&#47;td>
<td>Again, I don't think this is applicable?<&#47;td>
<&#47;tr>
<tr>
<td>updated<&#47;td>
<td><&#47;td>
<td>When the feed last changed.  This should be the last modified time of the most recently updated ticket.  Not quite sure what to do about this one yet.<&#47;td>
<&#47;tr>
<&#47;tbody>
<&#47;table>

<h3>Entry data<&#47;h3>
<table>
  <thead>
    <tr>
      <td>Atom element<&#47;td>
      <td>Equivalent MailManager attribute<&#47;td>
      <td>Notes<&#47;td>
    <&#47;tr>
  <&#47;thead>
  <tbody>
<tr>
<td>author<&#47;td>
<td><code>Ticket.from_email<&#47;code> and <code>Ticket.from_name<&#47;code><&#47;td>
<td>The person who initially opened the ticket.<&#47;td>
<&#47;tr>
<tr>
<td>category<&#47;td>
<td><code>Ticket.status<&#47;code><&#47;td>
<td>The current status of the ticket.  Since you can have 0..* categories per atom entry, perhaps we should have one for status, and for each of category0..2?  How about one for specifying the account the message came from?  How are categories actually shown in feed agents?<&#47;td>
<&#47;tr>
<tr>
<td>content<&#47;td>
<td><&#47;td>
<td>Should we show some content?  Just a summary?  The latest message?  All the messages in the ticket?<&#47;td>
<&#47;tr>
<tr>
<td>contributor<&#47;td>
<td><code>[msg.from_email, msg.from_name for msg in self.sql.listMessages (message_id = Ticket.message_id)]<&#47;code><&#47;td>
<td>Or something along those lines...  Basically a list of all the unique contributors to the ticket.<&#47;td>
<&#47;tr>
<tr>
<td>id<&#47;td>
<td><&#47;td>
<td>Again, not sure about that.  Some concatenation of the tid and the MailManager instance's id.<&#47;td>
<&#47;tr>
<tr>
<td>link (rel=alternate)<&#47;td>
<td><&#47;td>
<td>Pointer to the HTML version.<&#47;td>
<&#47;tr>
<tr>
<td>link (rel=reply)<&#47;td>
<td><&#47;td>
<td>Just a thought ... perhaps provide a link which might be usable by some agents as something to send a reply.  Maybe not, since the reply form is on the main ticket screen anyway.  But maybe there should be rel=close or rel=spam with links to immediately close, or mark as spam, respectively?<&#47;td>
<&#47;tr>
<tr>
<td>published<&#47;td>
<td><code>Ticket.date_opened<&#47;code><&#47;td>
<td>When the ticket was first opened.<&#47;td>
<&#47;tr>
<tr>
<td>rights<&#47;td>
<td>n&#47;a<&#47;td>
<td>I don't think this is relevant?<&#47;td>
<&#47;tr>
<tr>
<td>source<&#47;td>
<td>n&#47;a<&#47;td>
<td>Don't think this is relevant either?<&#47;td>
<&#47;tr>
<tr>
<td>summary<&#47;td>
<td><&#47;td>
<td>Maybe this should be something like the ticket details box on ticket_index_html.zpt?  Listing the ticket id, Subject, assigned, status, priority, categories, support of, supporters &amp; respond by?  That way, even if the feed reader doesn't do anything useful with all the meta data we're supplying, it'll still be there in a visible format.<&#47;td>
<&#47;tr>
<tr>
<td>title<&#47;td>
<td><code>Ticket.subject<&#47;code><&#47;td>
<td><&#47;td>
<&#47;tr>
<tr>
<td>updated<&#47;td>
<td><&#47;td>
<td>When the ticket was last updated.<&#47;td>
<&#47;tr>

<&#47;tbody>
<&#47;table>

<h3>Additional random notes<&#47;h3>

Not something for the first iteration, but we could supply the original messages of a ticket, or the attachments, as an enclosure.

Does any of this make sense?

Comments?
