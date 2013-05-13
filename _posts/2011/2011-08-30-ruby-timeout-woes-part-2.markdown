---
layout: post
status: publish
published: true
title: Ruby Timeout Woes, Part 2
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
excerpt: in which I discover how Ruby's Timeout implementation actually works, and
  discover why some of our code inside a timeout block never really times out.
wordpress_id: 629
wordpress_url: http://woss.name/?p=629
date: 2011-08-30 14:09:41.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- ruby
- timeout
- exceptions
- threads
- bugs
- delayed job
comments:
- id: 1248
  author: Anonymous
  author_email: anon@anon.com
  author_url: ''
  date: !binary |-
    MjAxMS0wOS0yNSAxNzozOTo0NiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wOS0yNSAxNjozOTo0NiArMDEwMA==
  content: ! '<p>The real fix is actually a lot simpler - stop using exceptions.<&#47;p>


    <p>Exceptions are a broken concept. You never know when and what you are going
    to get, for all you know even a stray ''puts'' chillin'' in your code might suddenly
    have a bad day and throw an IOError taking your program with it to the grave.<&#47;p>


    <p>They are also harder, and uglier, to handle. Ruby''s File.open is a stellar
    example on how exceptions should <em>not<&#47;em> be used. Instead of simply returning
    a null file pointer, which requires simple one line ''if'' to handle, you need
    a lot more complicated begin-rescue-end block.<&#47;p>


    <p>File.open is also a blatant violation of the very idea behind exceptions. Exceptions
    should be, well, exceptional. Now, is a failure to open a file an exception? That
    depends on what file we are dealing with. If it is a file that was distributed
    with your software that should always be available, and is missing - that''s an
    exception. However, if it is a file that the user wants us to open, it should
    be expected that something can be wrong with it - it might not exist or it might
    not be readable by us - there isn''t anything exceptional with those conditions
    so an exception should not be thrown, yet File.open is oblivious to all of this
    and just shoves an IOError (or whatever gets thrown) down our throats.<&#47;p>

'
- id: 1251
  author: Lee Hambley
  author_email: lee.hambley@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wOS0yNiAxNDo1Nzo1NCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wOS0yNiAxMzo1Nzo1NCArMDEwMA==
  content: ! "<p>On what grounds do you state:<&#47;p>\n\n<blockquote>\n  <p>PS, library
    authors, your exceptions should inherit from StandardError, not Exception.<&#47;p>\n<&#47;blockquote>\n\n<p>It's
    a fair point, but saying that \"exceptions shouldn't inherit from Exception\"
    does seem somewhat of a paradox.<&#47;p>\n"
- id: 1529
  author: Richard Ryan
  author_email: ryanr_guam@yahoo.com
  author_url: ''
  date: !binary |-
    MjAxMy0wMi0xOCAyMjo0OTowMCArMDAwMA==
  date_gmt: !binary |-
    MjAxMy0wMi0xOCAyMjo0OTowMCArMDAwMA==
  content: ! "<p>Excellent example.  It got me to thinking about a workaround that,
    while not great, was still somewhat readable.  One problem I found as demonstrated
    in your example is that information about the Timeout::Error exception class gets
    lost in the timeout exception so I forced the issue by doing this<&#47;p>\n\n<p>\nrequire
    'timeout'<&#47;p>\n\n<p>puts \"#{Time.now}: Starting\"\nbegin\n   Timeout.timeout(5,
    Timeout::Error) do\n  begin\n     sleep 10\n   rescue Timeout::Error => e\n    raise
    e\n  rescue Exception => e\n    puts \"#{Time.now}: Caught an exception: #{e.inspect}\"\n
    \ end\n  sleep 10\n  end\nrescue Timeout::Error => e\n    puts \"#{Time.now}:
    Timeout: #{e}\"\nelse\n    puts \"#{Time.now}: Never timed out.\"\nend\n<&#47;p>\n\n<p>Another
    thing I did was to create a unique class name for the Timeout::Error exception
    and use that instead of Timeout::Error so if there was another Timeout::Error
    inside the rescue block it wouldn't get raised again.  Something like<&#47;p>\n\n<p>\nclass
    MyTimeoutError < Timeout::Error\nend\n   ...\nTimeout::timeout(5, MyTimeoutError)
    do\n  ...\n  rescue MyTimeoutError => e\n    raise e\n  ...\n<&#47;p>\n"
---
I started digging into how Ruby's timeout mechanism worked this morning, in order to get to the bottom of a bug we've got.

Let me give you a little context. We use [Delayed Job](https:&#47;&#47;github.com&#47;tobi&#47;delayed_job) to run some of our longer running tasks. Delayed job wraps all its jobs in a timeout, which we've set to 20 minutes. That's a good thing: I don't really want a job running forever and, consequently, tying up one of our workers forever. So, we've got Delayed Job wrapping arbitrary code in Ruby's built in `Timeout`. What can possibly go wrong?

Well, it turns out that, for one particular job, the timeout mechanism wasn't working, and the job was carrying on well past the 20 minute timeout we'd set. Worse still, when a running job exceeds the maximum run time, Delayed Job will assume that the entire worker died, break the lock and hand the job to another worker. So we wound up with every single delayed job worker in our cluster running the same job, to completion, no matter how long it took.

Suboptimal, eh?

I started digging into Delayed Job, our code, and the `Timeout` implementation to see if I could figure out what was going wrong. Delayed Job is doing fine, nothing unusual there. The `Timeout` implementation is interesting. It creates a separate thread, which then sleeps for the timeout length. If the main thread completes its block before the timeout, it just kills the timeout thread and carries on happily. However, if the timeout thread wakes up before the main thread has completed execution, then it raises an exception on the main thread. The timeout method catches that exception on the main thread, tidies up and raises a `Timeout::Error` exception.

There are a few problems with that implementation (every call to `Timeout.timeout` creates a new thread, and it makes use of `Thread.raise` and `Thread.kill` which, as [Charles Nutter pointed out a few years back](http:&#47;&#47;headius.blogspot.com&#47;2008&#47;02&#47;rubys-threadraise-threadkill-timeoutrb.html) is a little broken), but we'll gloss over them for now. That's not what was causing my woes today. Let's reduce the problem to a simple example:

<pre lang="ruby">
require 'timeout'

puts "#{Time.now}: Starting"
begin
  Timeout.timeout(5) do
    begin
      sleep 10
    rescue Exception => e
      puts "#{Time.now}: Caught an exception: #{e.inspect}"
    end
    sleep 10
  end
rescue Timeout::Error => e
  puts "#{Time.now}: Timeout: #{e}"
else
  puts "#{Time.now}: Never timed out."
end
<&#47;pre>

Let's see what happens when we run that wee snippet:

    Tue Aug 30 13:38:56 +0100 2011: Starting
    Tue Aug 30 13:39:01 +0100 2011: Caught an exception: #<#<Class:0x1001337f0>: execution expired>
    Tue Aug 30 13:39:11 +0100 2011: Never timed out.

The inside rescue block is catching some exception after the timeout has expired, but the one expecting the timeout error never gets it. That's down to the implementation of `Timeout`. When the timer thread reawakened, it threw an exception on the main thread. The exception it threw on the main thread inherits from `Exception`, so anything that catches `Exception` will catch it before it bubbles back up the stack to the `timeout` method. So, while we've timed out the inner block, we've neutered the overall effect of the timeout method.

Lessons learned:

* Catching generic `StandardError` exceptions is crazy enough, but you probably never want to catch `Exception`. PS, library authors, your exceptions should inherit from `StandardError`, not `Exception`.

* Ruby's built in `Timeout` mechanism is crazy in a whole new and interesting way, too. Be careful how you use it.
