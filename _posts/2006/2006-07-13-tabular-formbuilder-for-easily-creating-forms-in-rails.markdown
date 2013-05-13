---
layout: post
title: Tabular FormBuilder for easily creating forms in Rails
date: 2006-07-13 12:11:44 +01:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- forms
- Geekery
- html
- rails
- ruby
- Ruby and Rails
- ruby-on-rails
- Work
- xhtml
comments:
- id: 547
  author: Edoardo "Dado" Marcora
  author_email: marcora@caltech.edu
  author_url: http://edoardo.marcora.net/
  date: !binary |-
    MjAwNi0wOS0xOSAxODowMzo1OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0xOSAxNzowMzo1OCArMDEwMA==
  content: ! '<p>Why not add an option :description to go alongside the :label option
    to provide both a short label (coming from column name if no :label if provided)
    and a longer description (coming from :description), see for example http://docs.neuroinf.de/PloneBook/img/3294f0302.png.</p>


    <p>Just my two cents,</p>


    <p>Dado ;)</p>'
- id: 548
  author: Eric O'Connell
  author_email: eric@roundpegdesigns.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0yNyAxNjoxOTo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNyAxNToxOTo1NiArMDEwMA==
  content: ! "<p>I made a little change to add some date convenience methods:</p>\n\n<p>module
    Rubaidh\n  module TabularForm\n    class TabularFormBuilder &lt; ActionView::Helpers::FormBuilder\n
    \     (field_helpers - %w(check_box radio_button)   %w(date_select datetime_select)).each
    do |selector|\n...</p>\n\n<p>Pretty dirty, but quite handy.  There's probably
    a better way to figure out which methods to add here. :)</p>\n\n<p>Thanks for
    your plugin!</p>"
- id: 549
  author: Joshua Sierles
  author_email: jsierles@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0wMiAwNDozMzozOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0wMiAwMzozMzozOSArMDAwMA==
  content: <p>On the latest Rails prerelease, this plugin will fail to load in development
    mode after the first request (seem like something to do with reloading of plugins).
    They aren't supposed to reload at all anymore. Any ideas? Cheers!</p>
- id: 550
  author: Kris
  author_email: kristapestry@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0yOCAwMjowNDowMSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0yOCAwMTowNDowMSArMDAwMA==
  content: <p>I have the same problem, not loading after the first request. I am looking
    into it right now.</p>
- id: 551
  author: Kris
  author_email: kristapestry@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0yOCAwMjowODoyNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0yOCAwMTowODoyNSArMDAwMA==
  content: <p>I worked around the problem by directly including the plugin in my application
    helper for now.</p>
- id: 552
  author: Tarmo TÃ¤nav
  author_email: tarmo@itech.ee
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0zMCAwMjowMzo0NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0zMCAwMTowMzo0NiArMDAwMA==
  content: <p>Joshua, the problem is that the init.rb file of the plugin extends ApplicationHelper,
    instead it should extend ActionView::Base. Just a simple change to get this working
    again, should be backwards compatible aswell.</p>
- id: 553
  author: Edwin
  author_email: poleris@friedneko.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0wNiAwNjo0NjoyMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0wNiAwNTo0NjoyMCArMDEwMA==
  content: <p>I tried that workaround by Tarmo but the plugin is still broken.</p>
- id: 554
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNy0wNiAwNzowODoyOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0wNiAwNjowODoyOCArMDEwMA==
  content: ! '<p>Tarmo: Thanks for pointing out the fix.  I''ve now incorporated it
    in svn.</p>


    <p>Y''all might want to look at http://svn.rubaidh.com/plugins/trunk/yet_another_form_builder
    which, thanks to a good friend &amp; CSS guru, now appears to lay out forms nicely
    with CSS.  Score!  At some point, I''ll document it and release it properly...</p>'
- id: 555
  author: Former
  author_email: alfonsgrabher@hotmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wMS0xOSAxODo1MzoxMCArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMS0xOSAxODo1MzoxMCArMDAwMA==
  content: ! '<p>Hm looks nice. Is this the best there is for rails 2.0? I''m new
    ... how do I use it,</p>


    <ol>

    <li>which one? the yet_another_form_builder or the svn link above? </li>

    </ol>


    <p>I tried both and both gave a 500, it says  tabular_form_for not found</p>'
---
OK, HTML forms.  There's a bit of a nightmare.  How do you style them so that they are semantically correct, but look good on all modern browsers?  I've tried in the past, and I've failed pretty miserably.  There's a couple of options out there:

* [Prettier Accessible Forms](http://alistapart.com/articles/prettyaccessibleforms)
* [Awesome Forms](http://paularmstrongdesigns.com/examples/css/awesome-form.html)

but they have their quirks and disadvantages too.  So I decided to be irritatingly pragmatic for now and use tables.  I know, it's not *right*, but it's good enough, OK?

So, I created a form builder to produce them.  Actually I first created it back in May, but I've finally gotten around to using it in anger, so it's been tidied up a little, and a few features added.  You can grab a copy from my plugin repository with the following magick juju:

    script/plugin install http://svn.rubaidh.com/plugins/trunk/form_builders

Add `-x` to make it an `svn:externals` and keep up to date with the latest version.

To make it work, you'd do something along the lines of:

    <% tabular_form_for('photograph', @photograph, :html => {:multipart => true}) do |f| %>
      <%= f.text_field 'title', :required => true %>
      <%= f.file_column_field 'file', :required => true %>
      <%= f.text_area 'description', :label => 'Longer description' %>
      <%= f.submit "Add" %>
    <% end %>

Notice how easy it was to create a form there, that will be styled consistently with all your other forms in your application?  Nice. :-)  I've added a couple of extra options.  If you pass `:required => true` into a field, it'll stick a '*' next to the field (and in true convention-over-configuration form, that's hard-coded, so tough :-P ).  By default it will create a label by humanising the field name, but you can always pass in something more friendly with `:label => 'Friendly field label'`.

That's about it, really.  Dead simple.  As usual, I'm open to feedback on improving it.  And patches.  Especially patches, in fact. :-)
