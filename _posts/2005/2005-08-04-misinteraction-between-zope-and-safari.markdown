---
layout: post
status: publish
published: true
title: Misinteraction between Zope and Safari?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
excerpt: ! 'This is something I submitted to Apple''s <a href="http:&#47;&#47;bugreport.apple.com&#47;"
  title="Apple Bug Reporter">radar<&#47;a> a couple of weeks ago, and I thought I''d
  reproduce it here in the hope that it might be <a href="http:&#47;&#47;www.google.com&#47;"
  title="The Collective Mind">Googlable<&#47;a> and that others might confirm&#47;deny
  the sighting.  The format below is that recommended by Apple.

'
wordpress_id: 23
wordpress_url: http://woss.name/?p=23
date: 2005-08-04 10:18:32.000000000 +01:00
categories:
- Geekery
- Python
tags: []
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
    ( http:&#47;&#47;www.zmws.com&#47; ) runnning on a windows box on the same local
    network.<&#47;p>


    <p>ZMWS does not send a content-length header but a Transfer-Encoding: Chunked
    one.<&#47;p>


    <p>Regards,<&#47;p>'
- id: 17
  author: Xavier Garreau
  author_email: xavier@xgarreau.org
  author_url: http://www.xgarreau.org/
  date: !binary |-
    MjAwNy0xMS0yOSAyMToyMDo0MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMS0yOSAyMDoyMDo0MyArMDAwMA==
  content: ! '<p>Just to let you know :<&#47;p>


    <p>After reading again RFC2616, removing the Transfer-Encoding: Chunked solved
    the problem.<&#47;p>


    <p>Maybe the Content-Length header sould not be sent as well. That sounds ok since
    a 304 response does not have a Body.<&#47;p>


    <p>Regards,

    Xavier<&#47;p>'
---
This is something I submitted to Apple's <a href="http:&#47;&#47;bugreport.apple.com&#47;" title="Apple Bug Reporter">radar<&#47;a> a couple of weeks ago, and I thought I'd reproduce it here in the hope that it might be <a href="http:&#47;&#47;www.google.com&#47;" title="The Collective Mind">Googlable<&#47;a> and that others might confirm&#47;deny the sighting.  The format below is that recommended by Apple.
<a id="more"></a><a id="more-23"></a>
<blockquote>
<h3>Summary<&#47;h3>

When using Safari to talk to a local <a href="http:&#47;&#47;www.zope.org&#47;" title="Zope Web Application Framework">Zope<&#47;a> (I'm using version 2.7.6) instance directly (rather than through an Apache front-end as we use in production) I often see the page fail to completely load, most or all of the images not appearing.  It would appear that there is some specific misinteraction with Safari and Zope when Zope returns an HTTP response code of <code>304 Not Modified<&#47;code>.

<h3>Steps to Reproduce<&#47;h3>

<ol><li>Find yourself a Zope server you can connect to.<&#47;li>
<li>Load an initial page that Safari has never seen before (including any of the graphics on that page).  Note that it appears fine.<&#47;li>
<li>Navigate to another page on the same site that shares some images from the first page.  Note that the page never finishes loading and that the images shared between the two pages are not displayed.<&#47;li><&#47;ol>

<h3>Expected Results<&#47;h3>

The page loaded correctly. :-)

<h3>Actual Results<&#47;h3>

The page itself loads, but the graphics which are shared between that page and the previous page (ie those that have been cached by Safari) never load.  Attached (hopefully!) is a screenshot showing the partially loaded page.

<h3>Regression<&#47;h3>

I've only ever seen this happen when talking to a Zope daemon with Safari on Mac OS X 10.4.  A colleague reports it having worked correctly with Mac OS X 10.3.8 at least and that matches my recollection.  Firefox works fine talking to the same Zope daemon, as does Internet Explorer on Windows XP.

<h3>Notes<&#47;h3>

I acquired the following from fiddling with tcpdump.  This is Safari's initial request for one of the images in question:

[code]GET &#47;mail&#47;images&#47;nav_search_off.gif HTTP&#47;1.1
Accept: *&#47;*
Accept-Language: en
Accept-Encoding: gzip, deflate
Cookie: __ac="bWFuYWdlcjpsZXRtZWlu"; __ac_name="manager"; _ZopeId="53475806A17sU7T18CI"
Referer: http:&#47;&#47;vindaloo.local:8120&#47;mail&#47;ticket&#47;000002?offset:int=0
User-Agent: Mozilla&#47;5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit&#47;412.6 (KHTML, like Gecko) Safari&#47;412.2
Connection: keep-alive
Host: vindaloo.local:8120[&#47;code]

and the start of the successful response:

[code]HTTP&#47;1.1 200 OK
Server: Zope&#47;(Zope 2.7.5-b1, python 2.3.4, linux2) ZServer&#47;1.1 Plone&#47;2.0.5
Date: Wed, 27 Jul 2005 15:08:15 GMT
Content-Length: 478
X-Cache-Control-Hdr-Modified-By: CookieCrumbler
Last-Modified: Thu, 17 Jul 2003 14:51:36 GMT
Cache-Control: no-cache
Content-Type: image&#47;gif

GIF89a...[&#47;code]

This is the conditional request which fails to complete:


[code]GET &#47;mail&#47;images&#47;nav_search_off.gif HTTP&#47;1.1
Accept: *&#47;*
Accept-Language: en
Accept-Encoding: gzip, deflate
Cookie: __ac="bWFuYWdlcjpsZXRtZWlu"; __ac_name="manager"; _ZopeId="53475806A17sU7T18CI"
Referer: http:&#47;&#47;vindaloo.local:8120&#47;mail&#47;Tickets
User-Agent: Mozilla&#47;5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit&#47;412.6 (KHTML, like Gecko) Safari&#47;412.2
If-Modified-Since: Thu, 17 Jul 2003 14:51:36 GMT
Connection: keep-alive
Host: vindaloo.local:8120[&#47;code]

and the response:

[code]HTTP&#47;1.1 304 Not Modified
Server: Zope&#47;(Zope 2.7.5-b1, python 2.3.4, linux2) ZServer&#47;1.1 Plone&#47;2.0.5
Date: Wed, 27 Jul 2005 15:08:44 GMT
Content-Length: 478
X-Cache-Control-Hdr-Modified-By: CookieCrumbler
Last-Modified: Thu, 17 Jul 2003 14:51:36 GMT
Cache-Control: no-cache
Content-Type: image&#47;gif[&#47;code]

I note that, from <code>tcpstat -ant<&#47;code>, that the TCP connection in question is still in the ESTABLISHED state:

[code]Active Internet connections (including servers)
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)
tcp4       0      0  192.168.2.38.51039     192.168.2.50.8120      ESTABLISHED[&#47;code]

I'm randomly wondering if Safari assumes there's going to be body data since the Content-Length header mentions there being 478 bytes, despite the fact that a 304 response mandates no body?<&#47;blockquote>

I've still not heard any response, after submitting the report on 27th July.  Aww, I thought I was being all helpful and rigorous in my description.  What have I missed mentioning?
