---
layout: post
title: Tracking which deployment you&#039;re looking at
date: 2007-06-26 02:15:30 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
---
Inspired by PJ's Err the Blog post [Cappin' the Stat](http://errtheblog.com/post/5961), I decided to put together a similar recipe of my own.  Sometimes I want to know which version was actually deployed and when.  This is more useful when I'm working in a team and there are a couple of people who are allowed to deploy the app, but sometimes it's just handy to know that the current live version is r73 from Subversion and that it was deployed at 3am.

So, I present a task that works nicely with Capistrano 2:

    namespace :rubaidh do
      # Tag the layout with the current release revision and date
      task :tag_layout_with_release_info, :roles => :app do
        release_info = <<-HTML

        <!-- #{application} subversion revision r#{real_revision},
             from #{repository}
             deployed by #{ENV['USER']} at #{Time.now.to_s}.
             Rendered by <%= Socket.gethostname %>.
          -->
        HTML
        layout = "#{release_path}/app/views/layouts/application.html.erb"
        run "perl -p -i -e 's?</body>?</body>#{release_info}?' #{layout}"
      end
    end

    after "deploy:update_code", "rubaidh:tag_layout_with_release_info"

It will put in a wee HTML comment at the end of your main application layout (you might want to tweak that name, if you use different layouts, or aren't living on the edge!) telling you the following:

* The name of the application.  Fair enough, you probably guessed that!
* The revision from subversion that was deployed and from which repository (could be useful if you deploy branches or tags rather than trunk).
* Who ran the deployment.  This is the local Unix user name of the person, but it should be good enough to track them.
* The time the deployment took place, again according to the client machine's own clock.  But we all run ntp, right?
* Finally, a wee extra that could just as easily have been in the template in the first place: the hostname of the machine that rendered the page.  This is particularly useful if you've got multiple hosts and you're trying to track down an app-server-specific issue.

Well, I figured it's useful enough to keep me from actually writing code instead. :-)

**Update** Somebody has suggested on their blog that [using perl is suboptimal](http://www.agmweb.ca/blog/andy/1968/) (at least I think that's the point he was trying to make).  It's habit, I'm afraid.  Using `sed -i` is not portable -- the `-i` flag doesn't exist on Solaris for example -- but Perl is ubiquitous and has had the in-place-edit ability for aeons.  I guess I could have used Ruby, but it would have taken me longer to look up how.
