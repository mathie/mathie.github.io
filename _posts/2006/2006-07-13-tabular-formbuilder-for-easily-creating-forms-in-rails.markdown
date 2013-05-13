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
