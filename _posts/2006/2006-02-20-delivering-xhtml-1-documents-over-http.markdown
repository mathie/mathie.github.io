---
layout: post
status: publish
published: true
title: Delivering XHTML 1 documents over HTTP
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 234
wordpress_url: http://woss.name/2006/02/20/delivering-xhtml-1-documents-over-http/
date: 2006-02-20 18:04:59.000000000 +00:00
categories:
- Geekery
- Python
tags: []
comments:
- id: 298
  author: Aigars Mahinovs
  author_email: aigarius@debian.org
  author_url: http://aigarius.blogspot.com/
  date: !binary |-
    MjAwNi0wMi0yMCAyMDowNjoxOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMCAxOTowNjoxOSArMDAwMA==
  content: <p>I have discovered that if Firefox loads a xHTML file in xHTML mode it
    makes a lot of problems with content inserting&#47;mangling with JavaScript. For
    example Flickr Badge and Google AdSence do not work in xHTML mode.<&#47;p>
- id: 299
  author: Sylvain Hellegouarch
  author_email: sh@defuze.org
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0yMCAyMTo1MzozNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMCAyMDo1MzozNyArMDAwMA==
  content: ! '<p>The bottom line is that :<&#47;p>


    <ul>

    <li>Send text&#47;html if you serve HTML<&#47;li>

    <li>Send application&#47;xhtml+xml if you serve XHTML<&#47;li>

    <&#47;ul>


    <p>Now if your pages are valid XHTML and do not host any other XML formats (such
    as XForms or SVG) then you may use text&#47;html. Now if you do, the UA will not
    handle your document as XML but as HTML which is not so much a problem when you
    serve XHTML which only matches what HTML4 offers.<&#47;p>


    <p>If you want to serve your XHTML as application&#47;xhtml+xml, you can be sure
    you''ll loose every users browsing via Internet Explorer because IE does not have
    any XML (hence XHTML) engine. Basically, IE does not understand the tiniest bit
    of XML. Nada. Interestingly, the IE team said they would not provide one in IE
    7 either because they''d rather take their time and do it well rather than do
    it badly (considering the fact XHTML appeared 5 years ago I can''t imagine how
    long it''ll take them...).<&#47;p>


    <p>What you could do so is to check the Accept header in the incoming HTTP request
    and see whether or not the UA supports application&#47;xhtml+xml and then send
    XHTML content, otherwise simply send HTML as text&#47;html.<&#47;p>


    <p>But this is quite annoying because it requires twice more work on the developer
    side which we should not have anymore. The problem is that as long as Microsoft
    holds such a big portion of the browser market, there is no chance for the situation
    to get better for you as a developer. This is the same old problem as their lack
    of support of CSS 2, XForms, SVG, etc.<&#47;p>


    <p>Remember also that when the UA works with an XML engine, that engine also applies
    to the CSS you include and any Javascript processing, so if you do have valid
    XHTML but you send it as text&#47;html, you may not get the expected result once
    you switch to application&#47;xhtml+xml.<&#47;p>'
- id: 300
  author: jml
  author_email: jason.lai@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0yMSAwMzoyMTowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAwMjoyMTowNSArMDAwMA==
  content: <p>I believe quirks mode is dependent on the !DOCTYPE tag at the top of
    the document.<&#47;p>
- id: 301
  author: Kai Hendry
  author_email: hendry@iki.fi
  author_url: http://natalian.org
  date: !binary |-
    MjAwNi0wMi0yMSAwOTo1Mzo1MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAwODo1Mzo1MSArMDAwMA==
  content: ! '<p>Current practice is to use HTML and abandon XHTML. XHTML is a waste
    of time. HTML is the future.<&#47;p>


    <p>http:&#47;&#47;whatwg.org&#47;<&#47;p>'
- id: 302
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMi0yMSAxMToxNTozMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAxMDoxNTozMyArMDAwMA==
  content: <p>Thanks for all your responses.  It sounds like there's not really a
    simple answer in practice, and that the easiest solution is to stick to the subset
    of XHTML 1.0 which is compatible with HTML, then serve it as <code>text&#47;html<&#47;code>.<&#47;p>
- id: 303
  author: Andy Baker
  author_email: andy@andybak.net
  author_url: http://www.andybak.net
  date: !binary |-
    MjAwNi0wMi0yMSAxODowMTo1OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAxNzowMTo1OSArMDAwMA==
  content: ! '<p>Just to clarify what other poster''s have said:<&#47;p>


    <p>This is nothing to with quirk''s mode. That is simply using the DOCTYPE to
    choose which type of HTML rendering to use.<&#47;p>


    <p>XHTML 1.1 MUST be served as application&#47;xhtml+xml to meet the specs. This
    will cause any version of IE to choke.<&#47;p>


    <p>XHTML 1.0 can be served at text&#47;html but (I think) then will be rendered
    as HTML.<&#47;p>


    <p>So as you say you can stick to the subset of XHTML that is recognized by HTML
    renderers but then you aren''t gaining much. The specs forbid you from serving
    XHTML 1.1 as text&#47;html...<&#47;p>'
- id: 304
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMi0yMSAxODoxNDozMiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAxNzoxNDozMiArMDAwMA==
  content: ! '<p>OK, so in summary, I have the following choices:<&#47;p>


    <ul>

    <li>I do the right thing regarding all the standards, use the latest hoopy XHTML
    1.1 code and lose my Internet Explorer audience completely.  It''s tempting, but
    I might be shooting myself in the foot!<&#47;li>

    <li>Stick to XHTML 1.0, and only the subset that is compatible with HTML 4, which
    seems pointless, since I might as well just use HTML 4 and get away with dodgy
    markup! :)<&#47;li>

    <li>Do the Apache Accept mangling trick, so that at least capable browsers get
    the right thing; IE can make a better-effort guess by being served text&#47;html.<&#47;li>

    <&#47;ul>


    <p>Hum te tum.  Who''d do web development, eh?<&#47;p>'
- id: 305
  author: Sylvain Hellegouarch
  author_email: sh@defuze.org
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0yMSAyMTo1NzozOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMSAyMDo1NzozOCArMDAwMA==
  content: ! '<p>Kai, considering that the WHATWG spec says:<&#47;p>


    <p>"This specification can also be viewed as an extension to [XHTML1]. In particular,
    some of the features added in this module only apply to XHTML documents"<&#47;p>


    <p>I assume one should not abandon XHTML.<&#47;p>


    <p>Now the problem was not about XHTML Vs HTML but what media type to use in each
    case. Since application&#47;xhtml+xml is NOT supported by IE, I guess that it
    is correct to say that current practice advise to keep on doing HTML 4.<&#47;p>'
- id: 306
  author: Louis
  author_email: CSpotkill@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0yMyAwOToyOTo0NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMyAwODoyOTo0NiArMDAwMA==
  content: ! '<p>It''s all overblown and you''re wasting your time talking about it.
    What pretty much everyone does is use XHTML 1.0 Transitional or Strict and serve
    it as text&#47;html. And that''s it. Now stop thinking about it and build sites!<&#47;p>


    <p>Something fun to try - visit meyerweb.com, zeldman.com, tantek.com and the
    like, and I''m sure no one bothers doing xhtml+xml sniffing. It''s just not worth
    it. But developing good XHTML coding habits is like using Ruby. It''s just the
    smart, pretty thing to do.<&#47;p>


    <p>I can''t imagine going back to unclosed  tags,  tags and tables for layout.
    (Shudders.)<&#47;p>'
- id: 307
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMi0yMyAwOTozMjozOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0yMyAwODozMjozOSArMDAwMA==
  content: ! '<p>Louis: That''s the most <em>pragmatic<&#47;em> answer I''ve heard
    so far.  Thank you. :)<&#47;p>'
- id: 308
  author: karl
  author_email: karl@la-grange.net
  author_url: http://www.la-grange.net/
  date: !binary |-
    MjAwNi0wMy0yNCAwMTozOTozMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yNCAwMDozOTozMCArMDAwMA==
  content: <p>I use XHTML without problems application&#47;xhtml xml and really it
    doesn't matter that much. It's a weblog, and the content is accessible also through
    RSS 1.0, if people using old IE versions want to access my content.<&#47;p>
---
I've been doing a bit of research this afternoon about how one is supposed to deliver XHTML documents which are correctly validated as either XHTML 1.0 or XHTML 1.1.  From [Sending XHTML as text&#47;html Considered Harmful](http:&#47;&#47;www.hixie.ch&#47;advocacy&#47;xhtml) and [XHTML Media Types](http:&#47;&#47;www.w3.org&#47;TR&#47;xhtml-media-types&#47;), I see that they really should be sent with a Content-Type of `application&#47;xhtml+xml`, but the former document states that IE 6 doesn't support content delivered with that type.

And apparently we really shouldn't send it as `text&#47;html`.  The reason given is that browsers are then forced into 'quirks mode' and presume it to be HTML4, complete with tag soup and subtly different interpretations.

Both these documents are quite old, so I was wonder what the current practice was?  Do most browsers correctly handle `application&#47;xhtml+xml`?  Or do modern browsers accept `text&#47;html` might not be quirky HTML 4 and make a more informed decision as to whether to treat it in quirks mode, or standards-compliance mode?

I am sending out validated XHTML 1.1, for the purposes of this query, so some of the arguments in the former paper (about the code not actually being valid XHTML) don't hold water.
