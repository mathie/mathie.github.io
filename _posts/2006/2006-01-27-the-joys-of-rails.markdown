---
layout: post
title: The Joys of Rails
date: 2006-01-27 09:47:54 +00:00
categories:
- Geekery
---
The past week or so has been interesting.  I've been doing a lot of development in my spare time, with <a href="http://www.rubyonrails.org/">Ruby on Rails</a>, putting together a basis for three different projects.  OK, since I haven't got all the spare time in the world ever, I should really be focusing on getting one of those projects to a releasable state before fiddling with the rest, but I'm just so *infused* with ideas right now that I can't help myself.

Test Driven Development.  That's part of what's doing it for me.  I write a bunch of tests which allow me to clarify the API of a particular function, or method or class.  "When I say this, the function will do this."  What better clues can you have as to how to implement it?  And the *joy* of having the test suite pass after you've written the code?  Unbeatable.  You actually feel that you've achieved something more than just another svn commit.  And, just with the layout of Rails applications, it makes testing so natural.  (I know, people keep banging on about this and I'm just another one of the chorus, but, well, it's true!)  All the skeleton stuff is there, you just have to write the individual test cases.  That takes out the barrier to writing them -- it's now a no-brainer.

Ease of deployment.  That's the other thing that's doing it for me.  In order to deploy my three current applications, I make sure the code I want to deploy is in my svn repository, then type `rake deploy`.  It just happens.  (OK, if there's also migration to be done, I suspect it's something along the lines of `rake remote_exec ACTION=disable_web && rake deploy and rake remote_exec ACTION=migrate && rake remote_exec ACTION=enable_web` but I haven't had to cross that bridge just yet and, when I do, I'll just write that into another rake task so I have to type `rake deploy_and_migrate`!)  This already works with my current hosting platform on a shared host.  But I'm confident that, when the time comes to scale, I'll have to change a few parameters in `config/deploy.rb` and type `rake deploy`.  It'll be that simple.  So I can worry about coding, about getting my application right, rather than spending half my time doing systems administration, updating deployed instances.

Let's just say that this compares favourably with another web application I have a lot of experience with...
