---
layout: post
title: Misinteraction between Zope and Safari?
excerpt: ! 'This is something I submitted to Apple''s <a href="http://bugreport.apple.com/"
  title="Apple Bug Reporter">radar</a> a couple of weeks ago, and I thought I''d reproduce
  it here in the hope that it might be <a href="http://www.google.com/" title="The
  Collective Mind">Googlable</a> and that others might confirm/deny the sighting.  The
  format below is that recommended by Apple.

'
date: 2005-08-04 10:18:32 +01:00
categories:
- Geekery
- Python
comments:
- id: 16
  author: Xavier Garreau
  author_email: xavier@xgarreau.org
  author_url: http://www.xgarreau.org/
  date: !binary |-
    MjAwNy0wMi0yMyAxNToyODoyNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0yMyAxNDoyODoyNSArMDAwMA==
  content: ! '<p>We noticed the same behaviour with Safari on Tiger connected to ZazouMiniWebServer
    ( http://www.zmws.com/ ) runnning on a windows box on the same local network.</p>


    <p>ZMWS does not send a content-length header but a Transfer-Encoding: Chunked
    one.</p>


    <p>Regards,</p>'
- id: 17
  author: Xavier Garreau
  author_email: xavier@xgarreau.org
  author_url: http://www.xgarreau.org/
  date: !binary |-
    MjAwNy0xMS0yOSAyMToyMDo0MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMS0yOSAyMDoyMDo0MyArMDAwMA==
  content: ! '<p>Just to let you know :</p>


    <p>After reading again RFC2616, removing the Transfer-Encoding: Chunked solved
    the problem.</p>


    <p>Maybe the Content-Length header sould not be sent as well. That sounds ok since
    a 304 response does not have a Body.</p>


    <p>Regards,

    Xavier</p>'
---
This is something I submitted to Apple's <a href="http://bugreport.apple.com/" title="Apple Bug Reporter">radar</a> a couple of weeks ago, and I thought I'd reproduce it here in the hope that it might be <a href="http://www.google.com/" title="The Collective Mind">Googlable</a> and that others might confirm/deny the sighting.  The format below is that recommended by Apple.
<a id="more"></a><a id="more-23"></a>
<blockquote>
<h3>Summary</h3>

When using Safari to talk to a local <a href="http://www.zope.org/" title="Zope Web Application Framework">Zope</a> (I'm using version 2.7.6) instance directly (rather than through an Apache front-end as we use in production) I often see the page fail to completely load, most or all of the images not appearing.  It would appear that there is some specific misinteraction with Safari and Zope when Zope returns an HTTP response code of <code>304 Not Modified</code>.

<h3>Steps to Reproduce</h3>

<ol><li>Find yourself a Zope server you can connect to.</li>
<li>Load an initial page that Safari has never seen before (including any of the graphics on that page).  Note that it appears fine.</li>
<li>Navigate to another page on the same site that shares some images from the first page.  Note that the page never finishes loading and that the images shared between the two pages are not displayed.</li></ol>

<h3>Expected Results</h3>

The page loaded correctly. :-)

<h3>Actual Results</h3>

The page itself loads, but the graphics which are shared between that page and the previous page (ie those that have been cached by Safari) never load.  Attached (hopefully!) is a screenshot showing the partially loaded page.

<h3>Regression</h3>

I've only ever seen this happen when talking to a Zope daemon with Safari on Mac OS X 10.4.  A colleague reports it having worked correctly with Mac OS X 10.3.8 at least and that matches my recollection.  Firefox works fine talking to the same Zope daemon, as does Internet Explorer on Windows XP.

<h3>Notes</h3>

I acquired the following from fiddling with tcpdump.  This is Safari's initial request for one of the images in question:

[code]GET /mail/images/nav_search_off.gif HTTP/1.1
Accept: */*
Accept-Language: en
Accept-Encoding: gzip, deflate
Cookie: __ac="bWFuYWdlcjpsZXRtZWlu"; __ac_name="manager"; _ZopeId="53475806A17sU7T18CI"
Referer: http://vindaloo.local:8120/mail/ticket/000002?offset:int=0
User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2
Connection: keep-alive
Host: vindaloo.local:8120[/code]

and the start of the successful response:

[code]HTTP/1.1 200 OK
Server: Zope/(Zope 2.7.5-b1, python 2.3.4, linux2) ZServer/1.1 Plone/2.0.5
Date: Wed, 27 Jul 2005 15:08:15 GMT
Content-Length: 478
X-Cache-Control-Hdr-Modified-By: CookieCrumbler
Last-Modified: Thu, 17 Jul 2003 14:51:36 GMT
Cache-Control: no-cache
Content-Type: image/gif

GIF89a...[/code]

This is the conditional request which fails to complete:


[code]GET /mail/images/nav_search_off.gif HTTP/1.1
Accept: */*
Accept-Language: en
Accept-Encoding: gzip, deflate
Cookie: __ac="bWFuYWdlcjpsZXRtZWlu"; __ac_name="manager"; _ZopeId="53475806A17sU7T18CI"
Referer: http://vindaloo.local:8120/mail/Tickets
User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2
If-Modified-Since: Thu, 17 Jul 2003 14:51:36 GMT
Connection: keep-alive
Host: vindaloo.local:8120[/code]

and the response:

[code]HTTP/1.1 304 Not Modified
Server: Zope/(Zope 2.7.5-b1, python 2.3.4, linux2) ZServer/1.1 Plone/2.0.5
Date: Wed, 27 Jul 2005 15:08:44 GMT
Content-Length: 478
X-Cache-Control-Hdr-Modified-By: CookieCrumbler
Last-Modified: Thu, 17 Jul 2003 14:51:36 GMT
Cache-Control: no-cache
Content-Type: image/gif[/code]

I note that, from <code>tcpstat -ant</code>, that the TCP connection in question is still in the ESTABLISHED state:

[code]Active Internet connections (including servers)
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)
tcp4       0      0  192.168.2.38.51039     192.168.2.50.8120      ESTABLISHED[/code]

I'm randomly wondering if Safari assumes there's going to be body data since the Content-Length header mentions there being 478 bytes, despite the fact that a 304 response mandates no body?</blockquote>

I've still not heard any response, after submitting the report on 27th July.  Aww, I thought I was being all helpful and rigorous in my description.  What have I missed mentioning?
