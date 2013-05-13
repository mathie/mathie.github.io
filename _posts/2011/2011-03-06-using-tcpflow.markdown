---
layout: post
status: publish
published: true
title: Using tcpflow
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
excerpt: Sometimes, when you're writing applications that use a library to talk over
  the wire to a remote service, it's difficult to see how the high level API the library
  exposes translates into the on-the-wire protocol. Funnily enough, I was having that
  very problem yesterday, so I dug `tcpflow` out my toolbox to better understand what
  was happening.
wordpress_id: 601
wordpress_url: http://woss.name/?p=601
date: 2011-03-06 13:15:18.000000000 +00:00
categories:
- Geekery
- Mac OS X
- Ruby and Rails
- Work
tags:
- tcpflow
- tcpdump
- libpcap
- tcpip
- eventmachine
- em-http-request
- protocols
- networking
- apis
- twisted
- reactor
comments:
- id: 1101
  author: Joe
  author_email: heckj@mac.com
  author_url: http://www.rhonabwy.com/wp/
  date: !binary |-
    MjAxMS0wMy0wNiAxNzowNDozOCArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0wNiAxNzowNDozOCArMDAwMA==
  content: ! '<p>Bill wrote a great little python script to make this flow even easier
    to use. You can find it at http:&#47;&#47;www.friday.com&#47;bbum&#47;2005&#47;03&#47;16&#47;httpflow-tcpflow-parser-to-help-debug-http&#47;.
    I''ve used your technique a number of times to debug libraries, and keep coming
    back to bill''s script because it''s so darned handy.<&#47;p>

'
- id: 1102
  author: Passerby
  author_email: Kirsch@mailnator.com
  author_url: ''
  date: !binary |-
    MjAxMS0wMy0wNiAxNzozODozOSArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0wNiAxNzozODozOSArMDAwMA==
  content: ! '<p>With using tcpdump, you probably would see that on second send you
    get RST packets indicating closed connection, a little bit mor obvious then spotting
    the same port and seeing that previous exchange closed the connection.<&#47;p>

'
- id: 1103
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAxMS0wMy0wNiAxODowODo0MiArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0wNiAxODowODo0MiArMDAwMA==
  content: ! '<p>Ooh, that does look handy, thanks!<&#47;p>

'
- id: 1104
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAxMS0wMy0wNiAxODoxMjoxNyArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0wNiAxODoxMjoxNyArMDAwMA==
  content: ! '<p>Aye, it occurred to me while I was writing up the post that, if I''d
    used <code>tcpdump<&#47;code>, I would have spotted the <code>FIN<&#47;code> packet
    from the remote host and figured it out quicker. You live and learn, eh?<&#47;p>

'
- id: 1116
  author: Dave Woodward
  author_email: dave@futuremint.com
  author_url: http://futuremint.com
  date: !binary |-
    MjAxMS0wMy0xMSAwMzowODo0NyArMDAwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0xMSAwMzowODo0NyArMDAwMA==
  content: ! '<p>I too banged my head against the wall for awhile before realizing
    the version of the gem I had installed was different than the code I was browsing
    on GitHub.  What made it worse was that the gem version was tied to my Rails version,
    so I wasn''t specifying a gem version number.  It took some digging just to figure
    out which version I was running!<&#47;p>

'
- id: 1530
  author: Simson Garfinkel
  author_email: simsong@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMy0wNC0yMSAyMDoyODowMCArMDEwMA==
  date_gmt: !binary |-
    MjAxMy0wNC0yMSAxOToyODowMCArMDEwMA==
  content: ! '<p>Your link to tcpflow links to the version that hasn''t been maintained
    for nearly a decade. The current version is at https:&#47;&#47;github.com&#47;simsong&#47;tcpflow.  New
    versions include improved platform support, dramatically improved performance,
    and a neat visualization layer.<&#47;p>

'
---
Sometimes, when you're writing applications that use a library to talk over the wire to a remote service, it's difficult to see how the high level API the library exposes translates into the on-the-wire protocol. Funnily enough, I was having that very problem yesterday, so I dug `tcpflow` out my toolbox to better understand what was happening.

I was writing a client for the [REDACTED] (for now, at least!) API, for a client project. I'd decided to use this as an excuse to learn [EventMachine](http:&#47;&#47;rubyeventmachine.com&#47;) and [em-http-request](https:&#47;&#47;github.com&#47;igrigorik&#47;em-http-request) to talk to the remote API. Given the pattern of use I'm expecting, a reactor-patterned daemon feels like a really good fit.

It was a weird experience -- it's the first time I've done any reactor pattern development in anger since ~2004 when I was messing around with using Python's [Twisted](http:&#47;&#47;twistedmatrix.com&#47;trac&#47;) framework for small TCP server applications. (Ah, them were the days, before HTTP became the hammer to everybody's wire protocol <strike>thumb<&#47;strike> nail.) But I digress...

I was having trouble understanding why the `em-http-request` requests I was making weren't having the intended result. There were two specific problems I saw over the course of the day:

* The path I was sending in, according to the documentation, using `request.get :path => '&#47;api&#47;v2&#47;chickens.json'`, didn't appear to be what was being requested (in that everything I requested looked like it was getting the same response as a request to `GET &#47;`).

* After the initial request, subsequent requests reusing the same `HttpRequest` object would silently fail. This was slightly more bizarre.

In solving either of these problems, I could have dived into the `em-http-request` source and traced what was happening. In fact, that was my first port of call but, being rusty at the reactor pattern, I was having trouble following the flow of execution. (As it turns out, if I've done this properly, I should have spotted the problem straight away, but we'll get to that.)

However, in this instance, I decided to treat the library I was using as a black box and instead examine what it was generating and consuming at the other end.

Enter [`tcpflow`](http:&#47;&#47;www.circlemud.org&#47;~jelson&#47;software&#47;tcpflow&#47;). It's been part of my arsenal of network debugging tools for as long as I can remember. It is similar to [`tcpdump`](http:&#47;&#47;www.tcpdump.org&#47;), but that typically just shows you the IP packets on the wire. `tcpflow` attempts to reconstruct the actual TCP streams to give you an idea of the conversation going on.

Let's install it. I'm on a Mac, and I'm using [Homebrew](http:&#47;&#47;mxcl.github.com&#47;homebrew&#47;), so it's just a case of:

    brew install tcpflow

Your mileage may vary, but it's a piece of software that's been around for a long time, so I bet there's a package for your system. If you're using Homebrew, it will install the binary as your user and not setuid to root, which means that, in order to access the packet capture device, you'll have to make sure and run it through `sudo`. The examples I show all have `sudo` in 'em since that's what I had to do.

`tcpflow` uses `libpcap` as the underlying packet capture library, the very same one as is used by `tcpdump`. This means that the syntax for specifying the information you want to capture will be familiar if you've used that tool before.

Last piece of background information before we get into solving the problems. You'll need to figure out the network interface you're using as that's the interface it will capture packets from. Short version (since a longer version is out of scope!): if you're on a Mac, it's highly likely to be `en0` if you're on wired Ethernet and `en1` if you're on wireless. If you're using Linux and you're on a wired network, chances are it'll be `eth0`. My Mac laptop is on a wireless network right now, so the examples show me using `en1`. Examine the output of `ifconfig` to determine your active network interface.

So, that's the theory, let's see this thing in action. The first problem is that we're not getting the response we're expecting from making particular HTTP requests. Let's see what's happening on the wire with `tcpflow`:

    sudo tcpflow -c -n en1 src or dst host api.example.com

Breaking that down:

* `-c` spits the flows out on stdout. The normal operation is to create a file for each flow, in each direction. If you're capturing a lot of data, or pipelined conversations, files are much more sane, but for small conversations like this, stdout is really convenient.

* `-n en1` is capturing from my wireless device, as discussed above.

* `src or dst host api.example.com` is the expression used to describe the flows that we want to capture. In essence, this is saying that we want to capture flows of data that are sent to, or received from, api.example.com. The language is pretty rich, allowing for a bunch of complex rules to narrow down the data captured, but I tend to find that specifying a remote host and&#47;or port is enough.

Let's see what that gets us. I've created a Ruby script, the essence of which is:

<pre lang="ruby">EM.run do
  request = EventMachine::HttpRequest.new('http:&#47;&#47;api.example.com&#47;')
  deferrable = request.get :path => '&#47;api&#47;v2&#47;chickens.json'
  deferrable.callback { puts "It worked"; EM.stop }
  deferrable.errback  { puts "It failed"; EM.stop }
end<&#47;pre>

Let's see what the on-the-wire communication turns into:

    172.017.012.012.53284-010.011.012.234.00080: GET &#47; HTTP&#47;1.1
    User-Agent: EventMachine HttpClient
    Host: api.example.com


    010.011.012.234.00080-172.017.012.012.53284: HTTP&#47;1.1 301 Moved Permanently
    Date: Sat, 05 Mar 2011 11:59:55 GMT
    Content-Type: text&#47;html
    Content-Length: 178
    Connection: close
    Location: http:&#47;&#47;www.example.com&#47;

    [ body content elided ]

That's annoying, because I'd specifically requested `&#47;api&#47;v2&#47;chickens.json`, but it's actually requesting `&#47;` (the `GET &#47; HTTP&#47;1.1` line). What's with that? Well, it turns out that the published stable gem for `em-http-request` doesn't actually implement the `:path` option; I need to install the beta 1.0 gem to get that. Oops. Moral of the story: if you're going to read the source to the gem you're using, read the source to the installed version you're using, not just the latest version on GitHub!

The second problem is a little more subtle. I got to the stage where the first request was working successfully, but subsequent requests reusing the same `HttpRequest` would fail miserably, just waiting for no response to occur. An example:

<pre lang="ruby">EM.run do
  request = EventMachine::HttpRequest.new('http:&#47;&#47;api.example.com&#47;')
  deferrable = request.get :path => '&#47;api&#47;v2&#47;chickens.json'
  deferrable.callback do
    deferred_eggs = request.get :path => '&#47;api&#47;v2&#47;chickens&#47;1&#47;eggs.json'
    deferred_eggs.callback { puts "It worked"; EM.stop }
    deferred_eggs.errback  { puts "Egg retrieval failed"; EM.stop }
  end
  deferrable.errback  { puts "It failed"; EM.stop }
end<&#47;pre>

Let's take a wee look at the over-the-wire conversation as captured by `tcpflow`:

    172.017.012.012.54442-010.011.012.234.00080: GET &#47;api&#47;v2&#47;chickens.json HTTP&#47;1.1
    User-Agent: EventMachine HttpClient
    Host: api.example.com


    010.011.012.234.00080-172.017.012.012.54442: HTTP&#47;1.1 200 OK
    Date: Sat, 05 Mar 2011 13:39:47 GMT
    Content-Type: application&#47;json;charset=ISO-8859-1
    Connection: close
    Set-Cookie: JSESSIONID=B4D6AE4456BC6D93E6B3441D4FEC6946; Path=&#47;api&#47;v2
    Content-Language: en-US

    [ body content elided ]


    172.017.012.012.54442-010.011.012.234.00080: GET &#47;api&#47;v2&#47;chickens&#47;1&#47;eggs.json HTTP&#47;1.1
    User-Agent: EventMachine HttpClient
    Host: api.example.com

Here we see the initial request, the response and the second request, but no response. That's really weird. Isn't it? Then I spotted something. Do you see the initial line of each flow, with a string of numbers? That's the source IP and port, then the destination IP and port. Let's break the first one apart:

    172.017.012.012.54442-010.011.012.234.00080

which translates to:

* the client IP address is `172.17.12.12`. That's the internal IP of my laptop on my home network.
* the client TCP port is `54442`. Both sides of a TCP connection get a port, and the client side usually has a random, unused, high port number chosen for it by the kernel. Each TCP connection gets a different client port, and they're typically not reused for a while after you're done with them.
* the server IP address is `10.11.12.234` which I cleverly remembered to change just now, lest you discover who [REDACTED] is. ;)
* the server TCP port is `80`, the well known port for HTTP.

Now, let's look at the second request's connection information:

    172.017.012.012.54442-010.011.012.234.00080

Isn't that interesting? They've both got the same client TCP port. Now, we're not doing keepalive, and the server responded with `Connection: close` (which, sadly, it does, even if I do attempt to switch keepalive on). So, as far as the server's concerned, the TCP session is done and it has closed the connection. But the client, `em-http-request`, hasn't closed its end, and has decided to send another request along the same TCP connection. Since the server has already closed its side of the connection, it never sees the second request and, naturally, never responds.

I smell a bug with `em-http-request` that I've reported here: [#77 Reusing `HttpRequest`](https:&#47;&#47;github.com&#47;igrigorik&#47;em-http-request&#47;issues&#47;#issue&#47;77).

I hope this has served as a useful introduction to `tcpflow`. It's a great tool for discovering what really happens on the wire when you're using higher level APIs and libraries. It *really* comes into its own when the library is, say, closed source and you *have* to deal with it as a black box. There are plenty of higher level tools with GUIs that can help you with this kind of task too, but I really like that `tcpflow` does one thing and does it really well. Thanks, [Jeremy](http:&#47;&#47;www.circlemud.org&#47;~jelson&#47;)!
