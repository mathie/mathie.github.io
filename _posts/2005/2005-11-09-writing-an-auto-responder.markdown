---
layout: post
status: publish
published: true
title: Writing an auto responder
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
excerpt: ! "<p>OK, mostly these are notes just now, as I do a little research for
  <a href=\"https:&#47;&#47;sourceforge.net&#47;tracker&#47;index.php?func=detail&aid=1350425&group_id=85788&atid=577305\">#1350425<&#47;a>.
  \ I'm trying to figure out what the 'correct' behaviour for an email auto responder
  is.  <a href=\"http:&#47;&#47;www.logicalware.com&#47;\">MailManager<&#47;a> has
  an auto response system which will send out an email when a ticket is submitted,
  to acknowledge its receipt.  I want to get it <em>right<&#47;em>.<&#47;p>\n\n<p>There
  are two problems:<&#47;p>\n\n<ul>\n  <li>Do you send an automatic response at all?
  \ Is there going to be a human being on the other end to receive it, or are you
  going to wind up spamming a mailing list, creating mailing loops, sending a message
  that will bounce?<&#47;li>\n  <li>If you do decide to send a message, who do you
  send it to?  That might sound daft, but there are a number of header fields which
  indicate who might wish receipt of a message, including ('From', 'Sender', 'Reply-To',
  'Return-Path', 'Resent-From').<&#47;li>\n<&#47;ul>\n\n<p>Currently <a href=\"http:&#47;&#47;www.logicalware.com&#47;\">MailManager<&#47;a>
  will refuse to send a response if any of the following conditions are met:<&#47;p>\n\n<ol>\n
  \ <li>It's a mailing list identified by the existence of any header in ('list-id',
  'list-help', 'list-unsubscribe', 'list-owner').<&#47;li>\n  <li>The Precedence header
  is set to one of ('junk', 'bulk', 'list').<&#47;li>\n  <li>There is no Return-Path,
  or Return-Path is empty.<&#47;li>\n  <li>The Return-Path starts with any of ('mailer-daemon',
  'owner-').<&#47;li>\n<&#47;ol>\n\n<p>And it will unconditionally send the auto response
  message to the address in Return-Path.  For dropping the message, I agree with everything
  but point 3 (which I'm not entirely sure about).  And I'm not convinced that the
  algorithm for choosing the reply address is robust enough.  So let's start digging
  into the RFCs.<&#47;p>\n"
wordpress_id: 177
wordpress_url: http://woss.name/?p=177
date: 2005-11-09 15:55:26.000000000 +00:00
categories:
- Geekery
- Python
- Work
tags: []
comments:
- id: 205
  author: Andrew Veitch
  author_email: andrew@logicalware.com
  author_url: http://www.logicalware.org/
  date: !binary |-
    MjAwNS0xMS0wOSAxNjo0NTo0NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wOSAxNTo0NTo0NiArMDAwMA==
  content: This looks really thorough. There's probably no urgency on it though, it
    looks like we're doing a better job than most mail agents.
- id: 206
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0xMS0wOSAxNjo1NDo0MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wOSAxNTo1NDo0MiArMDAwMA==
  content: Yeah, I've satisfied myself that we do (enough of) the right thing now,
    so I've closed the bug in question.  Turns out it was his MTA (<a href="http:&#47;&#47;www.merakmailserver.com&#47;"
    rel="nofollow">Merak<&#47;a>) not setting Return-Path...
- id: 207
  author: Philipp Wesche
  author_email: phi1ipp@yahoo.com
  author_url: http://www.philippwesche.org/
  date: !binary |-
    MjAwNS0xMS0xNyAxNjoyMzoxNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0xNyAxNToyMzoxNSArMDAwMA==
  content: ! 'Nice that you''re working on auto-reply features. I don''t know MailManager,
    but I''ve just written a comment indicating three features that are currently
    missing from a lot of auto-reply setup interfaces, maybe you''ll want to read
    this:

    http:&#47;&#47;braintickle.blogspot.com&#47;2005&#47;11&#47;auto-reply-interface-priorities.html


    Cheers,


    Philipp'
---
<p>OK, mostly these are notes just now, as I do a little research for <a href="https:&#47;&#47;sourceforge.net&#47;tracker&#47;index.php?func=detail&aid=1350425&group_id=85788&atid=577305">#1350425<&#47;a>.  I'm trying to figure out what the 'correct' behaviour for an email auto responder is.  <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a> has an auto response system which will send out an email when a ticket is submitted, to acknowledge its receipt.  I want to get it <em>right<&#47;em>.<&#47;p>

<p>There are two problems:<&#47;p>

<ul>
  <li>Do you send an automatic response at all?  Is there going to be a human being on the other end to receive it, or are you going to wind up spamming a mailing list, creating mailing loops, sending a message that will bounce?<&#47;li>
  <li>If you do decide to send a message, who do you send it to?  That might sound daft, but there are a number of header fields which indicate who might wish receipt of a message, including ('From', 'Sender', 'Reply-To', 'Return-Path', 'Resent-From').<&#47;li>
<&#47;ul>

<p>Currently <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a> will refuse to send a response if any of the following conditions are met:<&#47;p>

<ol>
  <li>It's a mailing list identified by the existence of any header in ('list-id', 'list-help', 'list-unsubscribe', 'list-owner').<&#47;li>
  <li>The Precedence header is set to one of ('junk', 'bulk', 'list').<&#47;li>
  <li>There is no Return-Path, or Return-Path is empty.<&#47;li>
  <li>The Return-Path starts with any of ('mailer-daemon', 'owner-').<&#47;li>
<&#47;ol>

<p>And it will unconditionally send the auto response message to the address in Return-Path.  For dropping the message, I agree with everything but point 3 (which I'm not entirely sure about).  And I'm not convinced that the algorithm for choosing the reply address is robust enough.  So let's start digging into the RFCs.<&#47;p>
<a id="more"></a><a id="more-177"></a>
<h3>RFC <a href="http:&#47;&#47;www.faqs.org&#47;rfcs&#47;rfc822.html">822<&#47;a> and <a href="http:&#47;&#47;www.faqs.org&#47;rfcs&#47;rfc2822.html">2822<&#47;a> -- Internet Message Format<&#47;h3>

<p>RFC 822 (which has been superseded by 2822, but appears to be more verbose on the subject) suggests, in section 4.4.4, that 'Sender' should <em>only<&#47;em> be used to indicate delivery problems.  If it gets as far as us, it's a successful delivery, so we should <strong>never<&#47;strong> send messages to the address listed in Sender.  So, we should send to the 'Reply-To' field for preference and, in its absence, 'From'.<&#47;p>

<p>RFC 2822 has a similar thing to say in section 3.6.2: we should use Reply-To, then From, for preference.  No mention is made of Sender with respect to responding to messages, so I think we can take RFC822's word for it that it shouldn't be used.  Section 3.6.6 rules out the possibility of using the Resent-From and Resent-Sender field for our purposes too.  Section 3.6.7 disavows any formal meaning of Return-Path for its purposes.<&#47;p>

<h3>RFC <a href="http:&#47;&#47;www.faqs.org&#47;rfcs&#47;rfc3798.html">3798<&#47;a> -- Message Disposition Notification<&#47;h3>

<p>It occurs to me at this point that the function we're really performing is a receipt notification, which is described in RFC 2298.  But I'll examine that some  other time...<&#47;p>

<h3>RFC <a href="http:&#47;&#47;www.faqs.org&#47;rfcs&#47;rfc3834.html">3834<&#47;a> -- Recommendation for Automatic Responses to Electronic Mail<&#47;h3>

<p>Finally, you think, he's gotten around to the RFC which is explicitly applicable to what we're trying to figure out, you think.  I'm just trying to be thorough, OK? :-)  OK, this doesn't apply at all if we decided that what MailManager is sending out is either a Message Disposition Notification or a Delivery Status Notification.  For the purposes of this section, we'll assume that's the case.  A summary of the relevant restrictions is:<&#47;p>

<ul>
  <li>Only send a response if the account is explicitly listed in one of the recipient fields ('To', 'Cc', 'Bcc' and the equivalent 'Resent-*' fields).<&#47;li>
  <li>Only send a response if the 'Auto-submitted' field is absent or set to 'no'.<&#47;li>
  <li>Drop the response if the Return-Path or From is '<>' (the <q>null address<&#47;q>).<&#47;li>
  <li>Drop the response if it looks like it might be from a mailing list.  Hints include <a href="http:&#47;&#47;www.faqs.org&#47;rfcs&#47;rfc2369.html">RFC2369<&#47;a> and <a href="http:&#47;&#47;www.faqs.org&#47;rfcs&#47;rfc2919.html">RFC2919<&#47;a> headers, the From address's local part being something like foo-owner or foo-request, or if the precedence is set to one of the commonly used 'low' types.<&#47;li>
  <li>Drop the response if the original message was not well formed.  Malformed messages are a hallmark of spam, so it seems sensible not to heed the first part of John Postel's famous maxim here.<&#47;li>
<&#47;ul>

<p>If it passes all of these conditions, we should send a response.  The format of the response should be something along the lines of:<&#47;p>

<ul>
  <li>The From header should be the account name in MailManager.<&#47;li>
  <li>The envelope from should address could be the null address to indicate that we don't want a response.<&#47;li>
  <li>In-Reply-To and References should be updated with the appropriate Message-Ids.<&#47;li>
  <li>The extra header 'Auto-Submitted: auto-replied' should be added.<&#47;li>
  <li>Prefix the existing subject field with the phrase 'auto: ' to indicate that it's an auto response.<&#47;li>
  <li>Add in some body text...<&#47;li>
<&#47;ul>

<p>And as for the address the message should be sent to, section 4 explicitly states that <q>automatic responses <strong>SHOULD<&#47;strong> be sent to the Return-Path field if generated after delivery.<&#47;q>  We <em>do<&#47;em> generate our message after delivery.  In fact it goes on to say that, if there's no Return-Path, it's a configuration error in the SMTP server, and that we should not deliver a response to <q>any address other than that in the Return-Path field, even if the Return-Path field is missing.<&#47;q>

<h3>Conclusion<&#47;h3>

<&#47;p><p>OK, one of the key things I set out to do was figure out, in my head, the address we should send an auto reply to.  It turns out that MailManager is already doing exactly what it's supposed to in that regard: sending it to the address in the Return-Path if it exists, dropping it otherwise.  I think we need to do a little work on making the situations where the message should get an auto response and when it shouldn't a little more explicit, but we're broadly on the right lines there, too.<&#47;p>

<p>Now I'm feeling the need to go code all this up explicitly in Python as an independent module which will, given the original message and a possible reply text, send out an auto reply if it's deemed appropriate, throwing an exception otherwise.  Maybe that's an evening's job sometime in the next couple of weeks.<&#47;p>

<p>Comments, questions?  Have I gotten things completely wrong?<&#47;p>
