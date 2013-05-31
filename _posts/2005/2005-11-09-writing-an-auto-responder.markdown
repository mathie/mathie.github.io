---
layout: post
title: Writing an auto responder
excerpt: ! "<p>OK, mostly these are notes just now, as I do a little research for
  <a href=\"https://sourceforge.net/tracker/index.php?func=detail&aid=1350425&group_id=85788&atid=577305\">#1350425</a>.
  \ I'm trying to figure out what the 'correct' behaviour for an email auto responder
  is.  <a href=\"http://www.logicalware.com/\">MailManager</a> has an auto response
  system which will send out an email when a ticket is submitted, to acknowledge its
  receipt.  I want to get it <em>right</em>.</p>\n\n<p>There are two problems:</p>\n\n<ul>\n
  \ <li>Do you send an automatic response at all?  Is there going to be a human being
  on the other end to receive it, or are you going to wind up spamming a mailing list,
  creating mailing loops, sending a message that will bounce?</li>\n  <li>If you do
  decide to send a message, who do you send it to?  That might sound daft, but there
  are a number of header fields which indicate who might wish receipt of a message,
  including ('From', 'Sender', 'Reply-To', 'Return-Path', 'Resent-From').</li>\n</ul>\n\n<p>Currently
  <a href=\"http://www.logicalware.com/\">MailManager</a> will refuse to send a response
  if any of the following conditions are met:</p>\n\n<ol>\n  <li>It's a mailing list
  identified by the existence of any header in ('list-id', 'list-help', 'list-unsubscribe',
  'list-owner').</li>\n  <li>The Precedence header is set to one of ('junk', 'bulk',
  'list').</li>\n  <li>There is no Return-Path, or Return-Path is empty.</li>\n  <li>The
  Return-Path starts with any of ('mailer-daemon', 'owner-').</li>\n</ol>\n\n<p>And
  it will unconditionally send the auto response message to the address in Return-Path.
  \ For dropping the message, I agree with everything but point 3 (which I'm not entirely
  sure about).  And I'm not convinced that the algorithm for choosing the reply address
  is robust enough.  So let's start digging into the RFCs.</p>\n"
date: 2005-11-09 15:55:26 +00:00
categories:
- Geekery
- Python
- Work
---
<p>OK, mostly these are notes just now, as I do a little research for [#1350425](https://sourceforge.net/tracker/index.php?func=detail&aid=1350425&group_id=85788&atid=577305).  I'm trying to figure out what the 'correct' behaviour for an email auto responder is.  [MailManager](http://www.logicalware.com/) has an auto response system which will send out an email when a ticket is submitted, to acknowledge its receipt.  I want to get it <em>right</em>.</p>

<p>There are two problems:</p>

<ul>
  <li>Do you send an automatic response at all?  Is there going to be a human being on the other end to receive it, or are you going to wind up spamming a mailing list, creating mailing loops, sending a message that will bounce?</li>
  <li>If you do decide to send a message, who do you send it to?  That might sound daft, but there are a number of header fields which indicate who might wish receipt of a message, including ('From', 'Sender', 'Reply-To', 'Return-Path', 'Resent-From').</li>
</ul>

<p>Currently [MailManager](http://www.logicalware.com/) will refuse to send a response if any of the following conditions are met:</p>

<ol>
  <li>It's a mailing list identified by the existence of any header in ('list-id', 'list-help', 'list-unsubscribe', 'list-owner').</li>
  <li>The Precedence header is set to one of ('junk', 'bulk', 'list').</li>
  <li>There is no Return-Path, or Return-Path is empty.</li>
  <li>The Return-Path starts with any of ('mailer-daemon', 'owner-').</li>
</ol>

<p>And it will unconditionally send the auto response message to the address in Return-Path.  For dropping the message, I agree with everything but point 3 (which I'm not entirely sure about).  And I'm not convinced that the algorithm for choosing the reply address is robust enough.  So let's start digging into the RFCs.</p>
<a id="more"></a><a id="more-177"></a>
<h3>RFC [822](http://www.faqs.org/rfcs/rfc822.html) and [2822](http://www.faqs.org/rfcs/rfc2822.html) -- Internet Message Format</h3>

<p>RFC 822 (which has been superseded by 2822, but appears to be more verbose on the subject) suggests, in section 4.4.4, that 'Sender' should <em>only</em> be used to indicate delivery problems.  If it gets as far as us, it's a successful delivery, so we should <strong>never</strong> send messages to the address listed in Sender.  So, we should send to the 'Reply-To' field for preference and, in its absence, 'From'.</p>

<p>RFC 2822 has a similar thing to say in section 3.6.2: we should use Reply-To, then From, for preference.  No mention is made of Sender with respect to responding to messages, so I think we can take RFC822's word for it that it shouldn't be used.  Section 3.6.6 rules out the possibility of using the Resent-From and Resent-Sender field for our purposes too.  Section 3.6.7 disavows any formal meaning of Return-Path for its purposes.</p>

<h3>RFC [3798](http://www.faqs.org/rfcs/rfc3798.html) -- Message Disposition Notification</h3>

<p>It occurs to me at this point that the function we're really performing is a receipt notification, which is described in RFC 2298.  But I'll examine that some  other time...</p>

<h3>RFC [3834](http://www.faqs.org/rfcs/rfc3834.html) -- Recommendation for Automatic Responses to Electronic Mail</h3>

<p>Finally, you think, he's gotten around to the RFC which is explicitly applicable to what we're trying to figure out, you think.  I'm just trying to be thorough, OK? :-)  OK, this doesn't apply at all if we decided that what MailManager is sending out is either a Message Disposition Notification or a Delivery Status Notification.  For the purposes of this section, we'll assume that's the case.  A summary of the relevant restrictions is:</p>

<ul>
  <li>Only send a response if the account is explicitly listed in one of the recipient fields ('To', 'Cc', 'Bcc' and the equivalent 'Resent-*' fields).</li>
  <li>Only send a response if the 'Auto-submitted' field is absent or set to 'no'.</li>
  <li>Drop the response if the Return-Path or From is '&lt;&gt;' (the <q>null address</q>).</li>
  <li>Drop the response if it looks like it might be from a mailing list.  Hints include [RFC2369](http://www.faqs.org/rfcs/rfc2369.html) and [RFC2919](http://www.faqs.org/rfcs/rfc2919.html) headers, the From address's local part being something like foo-owner or foo-request, or if the precedence is set to one of the commonly used 'low' types.</li>
  <li>Drop the response if the original message was not well formed.  Malformed messages are a hallmark of spam, so it seems sensible not to heed the first part of John Postel's famous maxim here.</li>
</ul>

<p>If it passes all of these conditions, we should send a response.  The format of the response should be something along the lines of:</p>

<ul>
  <li>The From header should be the account name in MailManager.</li>
  <li>The envelope from should address could be the null address to indicate that we don't want a response.</li>
  <li>In-Reply-To and References should be updated with the appropriate Message-Ids.</li>
  <li>The extra header 'Auto-Submitted: auto-replied' should be added.</li>
  <li>Prefix the existing subject field with the phrase 'auto: ' to indicate that it's an auto response.</li>
  <li>Add in some body text...</li>
</ul>

<p>And as for the address the message should be sent to, section 4 explicitly states that <q>automatic responses <strong>SHOULD</strong> be sent to the Return-Path field if generated after delivery.</q>  We <em>do</em> generate our message after delivery.  In fact it goes on to say that, if there's no Return-Path, it's a configuration error in the SMTP server, and that we should not deliver a response to <q>any address other than that in the Return-Path field, even if the Return-Path field is missing.</q>

<h3>Conclusion</h3>

</p><p>OK, one of the key things I set out to do was figure out, in my head, the address we should send an auto reply to.  It turns out that MailManager is already doing exactly what it's supposed to in that regard: sending it to the address in the Return-Path if it exists, dropping it otherwise.  I think we need to do a little work on making the situations where the message should get an auto response and when it shouldn't a little more explicit, but we're broadly on the right lines there, too.</p>

<p>Now I'm feeling the need to go code all this up explicitly in Python as an independent module which will, given the original message and a possible reply text, send out an auto reply if it's deemed appropriate, throwing an exception otherwise.  Maybe that's an evening's job sometime in the next couple of weeks.</p>

<p>Comments, questions?  Have I gotten things completely wrong?</p>
