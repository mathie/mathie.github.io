---
layout: post
status: publish
published: true
title: Notes from a Rails Course
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 266
wordpress_url: http://woss.name/2006/05/07/notes-from-a-rails-course/
date: 2006-05-07 10:00:51.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 418
  author: Jeremy
  author_email: jeremyw@igmus.org
  author_url: ''
  date: !binary |-
    MjAwNi0wNS0wNyAyMDo1NjozNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0wNyAxOTo1NjozNyArMDEwMA==
  content: <p>Thanks.  Good stuff in here.<&#47;p>
- id: 419
  author: Gerard Byrne
  author_email: gbyrne@experience.ie
  author_url: http://experience.ie
  date: !binary |-
    MjAwNi0wNS0xMiAwNToyMzoxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0xMiAwNDoyMzoxOSArMDEwMA==
  content: ! '<p>Thanks from me too. How''s life in Scotland?<&#47;p>


    <p>I''ve been snowed under since the course - a new project is at that critical
    "dev complete" and about to go to QA. The last project managed to survive a 4
    week QA with zero defects (0 S1, 0 S2, about 6-8 of S3 (cosmetic, trivials)) and
    the bar has been set same for this one. I need to show that the first project
    was not a one-hit-wonder!<&#47;p>'
---
I've been meaning to post my copy of these for a few weeks now.  I took some notes while I attended a 4 day course about Ruby on Rails, taught by [Chad Fowler](http:&#47;&#47;www.chadfowler.com&#47;), down at [Skills Matter](http:&#47;&#47;www.skillsmatter.com&#47;) in London.  Really I meant to tidy them up before posting, but I'm really busy with paying work (yay!) just now, so it would have to wait...

### Ruby on Rails course notes ###

#### Day One: Core Ruby ####

* Locals are *not* inherited from their parent scope.  For example `a = 3; def hello; puts a; end` complains about an undefined variable.  The only way to make that
  work is to explicitly define `a` as a global variable by calling it
  `$a`: `$a = 3; def hello; puts $a; end`

* Neat: to find the methods of a particular object, *but not those of the
  parent object*, do: `"asdf".methods - Object.methods` which will return
  an array of all the methods of object `String`.

* To find a particular method: `"asdf".methods.grep &#47;up&#47;` greps through the
  array to find items that match that RE.

* Ruby doesn't actually support named arguments yet (planned for 2.0?).  It's
  emulated in Rails by the last argument to a function being a hash.  So this:

    link\_to "display name", :action => "action", :controller => 'controller'

  actually parsed as this:

    link\_to "display name", {:action => "action", :controller => 'controller'}

* Take a look at `throw`&#47;`catch`, and continuations for creating resumable
  or retryable exceptions.

* Coercion between types will use `to_str`, `to_int`, etc for attempting
  to coerce an object to a string&#47;integer internally.  `to_s` and `to_i`
  produce human-readable representations.

* Interacting with shell programs:

    grepper = IO.p open("grep ruby", "w+")
    grepper.puts "This line will not print"
    grepper.puts "But this ruby one will!"
    grepper.close\_write
    puts grepper.read

  should return the second line...

* Inside a subclass, calling `super` is sufficient by itself -- you don't
  have to specify the method name or arguments.  It figures them out
  automagically from the current method and arguments.  It can be overridden
  if necessary.

* Mixins (using `include`) behave as if they are inherited methods.  So you
  can override them and call `super` and so on, as usual.

* `yield 1` is exactly equivalent to `block.call(1)` FSVO block: `def x &block`...

* ''.split is unicode safe - `'unicode string'.split &#47;&#47;` will split a string
  into its individual characters, even for multibyte characters.

* Use StringIO as mock object 'files' since lots of places use the IO interface.
  See 4::12 for more info.

* The only false values are `nil` and `false`.  In particular, `0` and `''` are true!

* In irb, typing `irb String` takes you inside the `String` context.  A nice
  shortcut for switching into scopes.  Kinda like `with foo do ... end`.

#### Day Two ####

* `ruby -c ...` tests ruby syntax.

* `ruby -rYAML -e 'begin; if YAML.load(File.read(ARGV[0])); puts "Syntax OK"; end; rescue Exception => e; puts e; end' ...`
  will do the same for YAML files. :)

* Look through the seaside tutorial for something completely different:
  http:&#47;&#47;www.seaside.st&#47;Tutorial&#47;

* Work on the models and domain logic, trying stuff out in the console.  Leave
  the controller&#47;view stuff 'til later...

* In `method_missing`, use `define_method ...` to create a dynamic method, then
  it'll already be there for next time.

* To find associations from the console, do `Model.reflections.keys`.

* For the art site, scope stuff automagically by using `@artist.`, for example
  `@artist.paintings.find(:all)` which returns all the paintings for the
  current artist.

* In the layout view, `@content_for_layout` is functionally equivalent to
  `@yield`.  But apparently `yield` is cooler. :)

* Quick way to find out what's coming in to an action ...
  `raise params.inspect`

#### Day Three ####

* Doing `model.Find(nil)`, for example, `model.Find(params[:contact])` where
  the contact doesn't exist in the form or where the contact is not an existant
  id, will raise a RecordNotFound exception.  To cope, something along the lines
  of `@contact = Contact.find(params[:contact]) resuce nil` will cause it to
  return nil.

* `foo.blank?` tests to see if it's empty or nil in Rails.  `0` is *not* blank, though!

* There's a new instance of a controller per request, so instance variables
  disappear at the end of the request.

* Like in python, there's `if __FILE__ == $0; main; end` for executing code if
  it's called as the script.

* In Test::Unit, `setup` and `teardown` will be called around *every single
  individual test*, not just at the start and end of the test case.  Also,
  the Test::Unit::TestCase is reinstantiated for every individual test.
  Somebody should introduce this concept to kev!

* You can use `breakpoint` in tests and it will break out to a prompt during
  the running of the test case.  `^d` resumes execution.  You can inspect
  *and modify* data from there.

* Use `model(:fixture_name)` instead of `@fixture_name` because instantiated
  widgets are slow and crap.

* To get a time appropriate to the database, do `Time.now.to_s(:db)`.  Drops
  time zone information, though.

* `rake db:fixtures:load` will load all the data fixtures *into the current
  environment*, which would be useful for priming the development
  environment.  It can be constrained with FIXTURES=x,y to only load particular
  model fixtures.

* Lookup the rake task in the slides to turn test data from scaffolding into
  the fixtures.  Slide 17 in the testing section, also in Rails Recipes.

* `config&#47;database.yml` goes through the erb processor before YAML gets it.

* Using `=begin`&#47;`=end` seems to work for commenting out sections of ERB files.

* `after_filter` happens after the *view*, not after the controller.

* Rather than doing convoluted stuff with ApplicationController's `before_filter`
  for having certain controllers require authentication, the controllers
  that need authentication could inherit from `InheritedController`, and
  put all the auth filter stuff in there, having *it* inherit from
  `ApplicationController`.

* In a partial, `<%= render :partial => "profile", :object => person %>` to
  make things a bit more intuitive, stick `<% person = profile %>` in profile.rhtml.
  Or maybe `<%= render :partial => "profile", :locals => person.attributes %>`.

* Normalisation (cleansing is probably the right word!) can be done in
  `before_validation`, so that way the cleansed form can still be validated.
  For the phone number example, it might be nice to have a separate module
  which provides the cleansing and validation, then mix it into the Active
  Record class.

* Observers *have* to be enabled in `config&#47;environment.rb`.

* See recipe 59 for using cache sweepers, which seems particularly neat
  for doing auditing.  **Cache sweepers are only run when caching is
  enabled, and it's *not* enabled by default in the development environment.**

* RJS *just totally rocks*!

#### Day Four ####

* When doing functional testing, the view is run as well when you do
  `get :foo`.

* See slide 7 on functional testing for doing a `login` helper for functional
  testing.

* Session expiration time is set globally via `config&#47;environment.rb`.

* Sessions can be loaded from the console for inspection, with
  `Marshal.load(File.read("tmp&#47;sessions&#47;ruby_sess...."))`.  Oh, and you can
  change the session file prefix too (though I can't remember how).

* `assert_tag` in functional testing parse the returned HTML and turn it
  into a DOM tree.  However, we don't think it'll work with XML (eg RSS, atom)
  too.

* Look at [WATIR](http:&#47;&#47;wtr.rubyforge.org&#47;), WebUnit and Selenium for testing
  UI stuff.

* Agiledocs is a method for generating documentation from your unit and
  functional tests.  Chad has a Ruby implementation on his web site.  The
  original is [TestDox](http:&#47;&#47;agiledox.sourceforge.net&#47;).

* For `has_many :books, :conditions => 'published = 1'`, we've discovered that if
  you do `model_instance.books.create ...`, it will **not** automatically set
  `published = 1` on the new instance.  So while it seems like you're adding
  a books to the has\_many collection of published books, you're not.  It
  should be possible to emulate that in some way with `with_scope`.

* `with_scope` doesn't work with `find_by_sql`.

* `with_scope` can be combined with a bit of metaprogramming to automatically
  limit the scope of actions very easily.  See
  [Nested With Scope](http:&#47;&#47;habtm.com&#47;articles&#47;2006&#47;02&#47;22&#47;nested-with_scope)

* `Appointment.find(:first, :include => [:contacts => [:addresses => :cities]])`
  is going to eagerly load the first appointment along with its contacts, their
  addresses and the addresses' cities!  Really nice for small data sets, but
  the DBA folks might get the heebie jeebies!

* Self referential habtm: see slides 14 and 15 in section 16 (advanced AR).
  Allows us to create reflexive self-referential habtm relationships using
  association callbacks.

* Polymorphic associations allow you to reuse the same table (say for example
  tags!) for multiple models.  So, in the Tag model, you'd do something along
  the lines of `belongs_to :taggable, :polymorphic => true` and, in each
  of your models, do `has_many :tags, :as => :taggable`.  The tags table would
  have fields `taggable_id` and `taggable_type`.  This implements one-to-many
  relationship where one model can have many tags.  For a many-to-many
  relationship, we need to look at a combination of polymorphic associations
  and `has_many :through`.  The real solution is to use DHH's
  `acts_as_taggable` though anyway. :)

* The splat notation works for routes.  So:
  `map.connect 'tag&#47;:id&#47;*tags', :controller => 'posts', :action => 'tag'`
  with `http:&#47;&#47;localhost:3000&#47;tag&#47;3&#47;a&#47;b&#47;c&#47;d` would cause `params[:action]`
  to contain `[a, b, c, d]`.

* If you want to include view stuff (say, some partials) in a plugin, you
  have to use the `render :file => '..&#47;views&#47;....'` form.

* Put models in a plugin to share them between different applications.  Just
  put the model files in `vendor&#47;plugins&#47;model_plugin&#47;lib&#47;model.rb`.

* For actually delivering messages in a Rails web application, perhaps the
  way to do it is dump the outgoing messages into a table, then use something like
  `script&#47;runner MailDeliveryQueue.deliver_all` in cron to push the messages outside
  of the context of a web request. Perhaps then use
  `MailDeliveryQueue.create(Mailer.create_mail_thingie)` to push mails into
  the queue...

* Look at vpim for generating iCal&#47;vcard stuff.

* multipart&#47;alternative support is done by having different versions of each
  view, one with each MIME type on it.  Ooh, shiny.

* If you POST to an action with content-type application&#47;xml and the XML is
  usefully formed like a hash, it will be pushed into params[].  So you can
  effectively push in XML-formatted active records into the db.

* Creating your own template handler (slide 10 on the XMLBuilder section)
  is useful for creating restricted templates that users can edit.  Say for
  example auto-replies for emails coming into a system...

* Definitely look at [rtex](http:&#47;&#47;codefluency.com&#47;pages&#47;rtex) for the
  BTMH project.
