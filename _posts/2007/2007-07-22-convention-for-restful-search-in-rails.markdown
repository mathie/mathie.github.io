---
layout: post
status: publish
published: true
title: Convention for RESTful search in Rails?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2007-07-22 18:12:22.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- RailsConf Europe
- Ruby and Rails
comments:
- id: 917
  author: Dan Kubb
  author_email: dan@kubb.name
  author_url: http://autopilotmarketing.com/
  date: !binary |-
    MjAwNy0wNy0yMiAyMDoxNDoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yMiAxOToxNDoyNiArMDEwMA==
  content: ! '<p>I use FoosController#index for all the searching I do, and in general
    I follow the conventions used by ARs, where query string parameters are used to
    "scope" the results.</p>


    <p>I take query_parameters, and filter against Foo#content_columns to get a conditions
    hash I can pass into Foo#find.</p>


    <p>For ordering of the results by convention I use two other query string params:
    :by and :sort.  The param :by is the attribute to sort the results by, and if
    :sort == ''reverse'' the I add DESC to Foo#find''s :order argument.</p>


    <p>For pagination, I just stick to the conventions of will_paginate, using :page
    to denote the page of results I''m on, and :per_page to set the number of results
    to use per page.  When there''s no per_page I just default to something reasonable
    (for me) like 25.</p>


    <p>The only thing I haven''t quite decided on is how to handle general keyword
    searches, like if someone wanted to search across a couple of attributes for records
    that match.  Under the hood you''d use something like Ferret to index the results.  I
    had just thought about using a :q parameter, and pass in whatever the user types
    in to the search library''s methods.</p>


    <p>On a related note, it would be absolutely awesome if there was a plugin that
    made this easy, and also added an View that returned an OpenSearch description
    document so that restful resources could be searched by OpenSearch compatible
    bots.</p>'
- id: 918
  author: Trevor
  author_email: trevor@corevx.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yOCAyMTowMTo1NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yOCAyMDowMTo1NCArMDEwMA==
  content: ! "<p>Exactly what I was looking for, thank you!</p>\n\n<p>I got an error
    about Array#unzip, so I dropped this in:</p>\n\n<p>class Array\n  def unzip( n=2
    )\n    (0...n).map { |i| map { |tuple| tuple[i] } }\n  end\nend</p>"
- id: 919
  author: Trevor
  author_email: trevor@corevx.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yOCAyMToxMToyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yOCAyMDoxMToyMyArMDEwMA==
  content: ! "<p>Also -</p>\n\n<p>Since I'm passing to will_paginate I found it handy
    to replicate with_search_terms slightly so I can just extract the proper conditions
    string:</p>\n\n<p><code>\ndef create_search_terms(params)\n  conditions = params.blank?
    ? [] : params.delete_if do |key, value|\n   !column_names.include?(key)\n  end.collect
    do |key, value|\n   [\"LOWER(#{table_name}.#{key}) LIKE ?\", \"%#{value.downcase}%\"]\n
    \ end.unzip\n  #end\n  #raise conditions.inspect</code></p>\n\n<p>conditions.length
    &gt; 1 &amp;&amp; conditions[0] = conditions[0].join(' AND ')\n  conditions =
    conditions.flatten</p>\n\n<p>conditions.empty? ? nil : conditions\nend\n</p>"
- id: 920
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNy0zMCAxODoxODozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0zMCAxNzoxODozNiArMDEwMA==
  content: ! "<p>Trevor: Ah, silly me, <code>Array#unzip</code> is defined in my <a
    href=\"http://svn.rubaidh.com/svn/plugins/trunk/rubaidh_platform\" rel=\"nofollow\">rubaidh_platform</a>
    plugin where I keep all the generic stuff I use across projects.  I should copy
    the definition across into this plugin to make it independent.</p>\n\n<p>As for
    using it with will_paginate, I already am.  I can't remember if I've changed something
    since you popped by, but I'm now doing something along the lines of:</p>\n\n<pre><code>class
    FooController &lt; ApplicationController\n  resource_search\n\n  def index\n    @foos
    = Foo.paginate :page =&gt; params[:page]\n  end\n  #...\nend\n</code></pre>\n\n<p>which
    does the right thing.  resource_search, in the background, creates an around_filter
    (by default just on index, though you can specify additional collection methods)
    which yields with_search_terms which is using with_scope.  All very neat, if I
    do say so myself. :)</p>"
- id: 921
  author: Rails Futzer
  author_email: futzer@mailinator.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0zMSAyMTozNzo1MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0zMSAyMDozNzo1MyArMDEwMA==
  content: <p>So you're looking at column names - shouldn't you look at attr_accessible/attr_protected
    as well?  Wouldn't just looking at column names let someone search for something
    they shouldn't?</p>
- id: 922
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wOC0wMSAwOTowMDozMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0wMSAwODowMDozMCArMDEwMA==
  content: ! '<p>Rails Futzer: You''re absolutely right.  In the application I extracted
    the plugin from and the application I first pushed it into I didn''t have any
    protected attributes for the models I was searching.  I''ll be sure to implement
    that when I first need it.  Patches gratefully accepted, of course. :-)</p>'
- id: 923
  author: Andrew Turner
  author_email: ajturner@highearthorbit.com
  author_url: http://highearthorbit.com
  date: !binary |-
    MjAwNy0wOC0wNyAxNjozMzo0MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0wNyAxNTozMzo0MCArMDEwMA==
  content: ! '<p>I''ve been wondering if something like <a href="http://www.opensearch.org"
    rel="nofollow">OpenSearch</a> is a good fit here for defining the types of search
    parameters that could be used for a Resource.</p>


    <p>It provides general search term, pagination, and even geo &amp; time support.
    Could then extend it as necessary to including other - or generic - search criteria.</p>'
- id: 924
  author: Andy Filer
  author_email: andyf@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wOC0yNSAwMToyMzoyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0yNSAwMDoyMzoyNCArMDEwMA==
  content: ! '<p>Great stuff. I''m glad to see someone''s talking about this. I tried
    the plugin, and it works for me except that I had to change

    "model.constantize.with_search_terms(params[model.downcase]) do" to "model.constantize.with_search_terms(params)
    do".</p>'
- id: 925
  author: Andy Filer
  author_email: andyf@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wOC0yNSAwMjoxMDoxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0yNSAwMToxMDoxMiArMDEwMA==
  content: <p>Never mind about the change. I see now that the format isn't just param=value
    but model[param]=value, of course.</p>
- id: 926
  author: Andy Filer
  author_email: andyf@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wOC0yNSAwMjoxOToxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0yNSAwMToxOToxNSArMDEwMA==
  content: ! "<p>Great stuff. Iâ€™m glad to see someoneâ€™s talking about this. I
    tried the plugin, and it works for me except that I had to change\nâ€œmodel.constantize.with_search_terms(params[model.downcase])
    doâ€\x9D to â€œmodel.constantize.with_search_terms(params[model.underscore]) doâ€\x9D.</p>\n\n<p>(This
    is my third post on this, and I was a bit confused -- I got thrown off because
    multi-word model names weren't working).</p>"
- id: 927
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wOC0yNSAxMTowNDoyNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0yNSAxMDowNDoyNyArMDEwMA==
  content: ! '<p>Andy: Good catch.  I''ve just committed the change to subversion.  Thanks!</p>'
- id: 928
  author: Toby Clemson
  author_email: tobyclemson@gmail.com
  author_url: http://N/A
  date: !binary |-
    MjAwNy0wOC0zMCAxMzo1OTozNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0zMCAxMjo1OTozNSArMDEwMA==
  content: ! '<p>Hi, I seem to be having a bit of trouble getting your plugin to work
    for me. Am I right in thinking that all that is necessary is to include the resource_search
    call in the controller? And this automatically wraps any method defined in the
    model in the scope of the conditions?

    Including inherited methods like find?</p>


    <p>I''m using edge rails - would that make a difference? Also I''m using the restful_authentication
    plugin which may be conflicting(?).</p>'
- id: 929
  author: Toby Clemson
  author_email: tobyclemson@gmail.com
  author_url: http://N/A
  date: !binary |-
    MjAwNy0wOC0zMCAxNToyODo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0zMCAxNDoyODo1NyArMDEwMA==
  content: ! '<p>Ok after reading up on with_scope, I''ve narrowed my problem down
    a little. It was because I was using a query string of ?key=val rather than the
    escaped version of model[key]=val.</p>


    <p>The trouble is that ActiveResource currently uses the ?key=val form if you
    call Resource.find(:all, :params =&gt; {:key =&gt; ''var''}) and I''m trying to
    use your plugin in a project involving a remote component using ARes.</p>


    <p>Can you suggest a modification to your plugin that would support the current
    ARes way of searching? And also support the query string method and the post method?
    I''d write a patch but I can''t think of an easy way to do it.</p>


    <p>I really like the way the plugin works at the moment - very smart way of implementing
    restful search and it doesn''t get in the way at all.</p>'
- id: 930
  author: Mike Vincent
  author_email: mike@vincent.ws
  author_url: http://mike.vincent.ws
  date: !binary |-
    MjAwNy0wOS0yMCAyMzowMjo1MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOS0yMCAyMjowMjo1MCArMDEwMA==
  content: ! "<p>Nice plugin Graeme.</p>\n\n<p>I modified it to add an OR #{table_name}.#{key}
    IS NULL if the value was nil to allow empty to allow matching nulls. might be
    mysql specific, I'm not sure. Here's what my modified with_search_terms method
    looks like:\n<code></code></p>\n\n<pre>\n        def with_search_terms(params)\n
    \         conditions = params.blank? ? [] : params.delete_if do |key, value|\n
    \          !column_names.include?(key)\n          end.collect do |key, value|\n
    \           condition = \"LOWER(#{table_name}.#{key}) LIKE ?\"\n            condition
    = \"(#{condition} OR #{table_name}.#{key} IS NULL)\" if value.nil?\n            [condition,
    \"%#{value.downcase if value}%\"]\n          end.unzip\n          conditions.length
    &gt; 1 &amp;&amp; conditions[0] = conditions[0].join(' AND ')\n          conditions
    = conditions.flatten.compact\n          with_scope :find =&gt; {:conditions =&gt;
    conditions.empty? ? nil : conditions} do\n            yield\n          end\n        end\n</pre>\n\n<p>\nsure
    that will not look pretty :)</p>\n\n<p>I also ran into issues with the page links
    will_paginate generated if the results ended up paginated. Seems in 1.2.3 has
    issues handling nested params, so the links that will_paginate generated were
    somewhat munged. :( Ryan Kinderman discusses the issue in greater detail and provides
    a plugin to fix it over at http://kinderman.net/articles/2007/02/07/passing-arrays-and-nested-params-to-url_for-in-rails</p>\n\n<p>Maybe
    helpful to others not using edge rails.</p>"
- id: 931
  author: GSIY &#8230; Ruby-Rails Portal
  author_email: ''
  author_url: http://www.gsiy.com/articles/re-restful-url-reference-on-microformats-wiki-13/
  date: !binary |-
    MjAwNy0xMC0wNCAwNDozNjozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0wNCAwMzozNjozMyArMDEwMA==
  content: <p>[...] &nbsp; &nbsp;http://woss.name/2007/07/22/convention-for-restful-search-in-rails/
    [...]</p>
- id: 932
  author: Kevin Schmeichel
  author_email: schmeic@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0xMiAyMTowMjowOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0xMiAyMDowMjowOCArMDEwMA==
  content: ! '<p>Any thoughts about extending this to also search by foreign key objects?  As
    a concrete example, I have a Business model that has a foreign key to an Address,
    and I want to be able to find all of a certain kind of business within 10 miles
    of me.</p>


    <p>How would I specify that certain search parameters apply to the foreign key
    model?</p>'
- id: 933
  author: Mike Burrows
  author_email: mjb@asplake.co.uk
  author_url: ''
  date: !binary |-
    MjAwNy0xMS0xMSAxNjozNDozMiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMS0xMSAxNTozNDozMiArMDAwMA==
  content: ! "<p>Nice!</p>\n\n<p>&lt;</p>\n\n<p>p&gt;\nI added this little helper
    to your form_helper.rb which (I hope) encapsulates the expected naming conventions
    for search field (and remembers their values)</p>\n\n<pre><code>\n        def
    search_field_for(model, field, options = {})\n          text_field_tag \"#{model}[#{field}]\",
    params[model].nil? ? nil : params[model][field]\n        end\n</code></pre>\n\n<p>&lt;</p>\n\n<p>p&gt;\nI'm
    having issues with</p>\n\n<pre>will_paginate</pre>\n\n<p>though - it's making
    a bit of a mess of the search parameters in the navigation links, losing rather
    than quoting the special characters.  Is it something I'm doing wrong?</p>"
- id: 934
  author: Mike Burrows
  author_email: mjb@asplake.co.uk
  author_url: ''
  date: !binary |-
    MjAwNy0xMS0xMyAyMjozNTowOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMS0xMyAyMTozNTowOSArMDAwMA==
  content: ! "<p>Oops, messed the formatting up a bit there.  I think I'm encountering
    the same problem you referred to previously in\n http://woss.name/2007/01/14/correct-route-generation-for-params-which-are-hashes/</p>\n\n<p>Did
    you find a solution?</p>"
- id: 935
  author: Richie Vos
  author_email: jerry.vos@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0xMi0yNiAxNToyNDoxMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMi0yNiAxNDoyNDoxMCArMDAwMA==
  content: ! '<p>@Toby

    I haven''t tried this plugin yet, but if all the params are nested under the model
    name (model[x], model[y]), you can get at all of them by just doing:

    find(:first, :conditions =&gt; params[:model])</p>


    <p>Is that what you were talking about?</p>'
- id: 936
  author: Toby Clemson
  author_email: tobyclemson@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wMS0xNiAxNzoyMjozNCArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMS0xNiAxNzoyMjozNCArMDAwMA==
  content: ! '<p>@Richie - The trouble I was having was that when using ActiveResource
    (i.e., the client API for REST web services) if I called:</p>


    <p>Resource.find(:all, :params =&gt; {:key =&gt; :val})</p>


    <p>it would generate a request to the application with the url:</p>


    <p>GET http://server.com/resource?key=val</p>


    <p>But resource_search would expect the parameter has to contain model[key] rather
    than just key.</p>


    <p>I wanted to know a way of making this plugin work regardless of the format
    of the query string or the POST parameters.</p>


    <p>I hope that makes more sense.</p>


    <p>Toby</p>'
- id: 937
  author: Don Morrison
  author_email: supposibly@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wMS0yMyAyMDoxMTowOSArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMS0yMyAyMDoxMTowOSArMDAwMA==
  content: ! '<p>Hi Graeme. I was looking at this plugin today. Very nice. It is exactly
    the kind of thing I wanted to do on models in my application. In reading the comments
    and in using it I noted that you have to prefix the key/val with the model name.
    I have a little hack to let you do it this way or the ARes way that Toby mentions
    above.</p>


    <p>Before I clean it up (it isn''t much), are you still using/maintaining/accepting
    patches for this plugin?</p>


    <p>Thanks for your hard work.

    Don</p>'
- id: 938
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wMS0yNCAxMTo0MzowNyArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMS0yNCAxMTo0MzowNyArMDAwMA==
  content: ! '<p>Don: I am about to refactor the plugin with a number of improvements
    I''ve been needing for another project.  Please do send your patch to me and I''ll
    make sure it''s incorporated. :-)</p>'
- id: 939
  author: Jason Boxman
  author_email: jasonb@edseek.com
  author_url: http://edseek.com/
  date: !binary |-
    MjAwOC0wMi0xOSAwNjozMjowMiArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMi0xOSAwNjozMjowMiArMDAwMA==
  content: ! '<p>Neat plugin.  For determining the model names from the controller,
    you might want to look at how the resource_controller plugin handles it.  It opionally
    lets you specificy a different model from the one derived from the controller
    name, too.</p>


    <p>For the SQL, you might want to look at the squirrel plugin just for fun.  It''s
    a neat plugin to Rubyize the conditions for AR#find.  You can obtain just the
    SQL by using it with Model.find(:query) do foo == ''bar'' end.conditions.to_sql</p>


    <p>Thanks!</p>'
- id: 940
  author: Jason Boxman
  author_email: jasonb@edseek.com
  author_url: http://edseek.com/
  date: !binary |-
    MjAwOC0wMi0xOSAyMTo0ODozNyArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMi0xOSAyMTo0ODozNyArMDAwMA==
  content: ! "<p>I know this plugin is more intended as a one-shot deal to allow for
    searching a model, but it might be nice to be able to override the SQL and produce
    a more crafted query per model.  I added the followingly quickly:</p>\n\n<p>My
    model (using squirrel plugin for SQL):</p>\n\n<p>def self.search_scope_conditions(params={})\n
    \ return nil if params.blank?\n  self.find(:query) do\n    last == params[:last]\n
    \ end.conditions.to_sql\nend</p>\n\n<p>model.rb:</p>\n\n<p>def with_search_terms(params)\n
    \ conditions = search_scope_conditions(params)\n  with_scope :find =&gt; {:conditions
    =&gt; conditions} do\n    yield\n  end\nend</p>\n\n<p>Maybe I should make it accept
    a block or a symbol.</p>\n\n<p>Just a thought.</p>"
---
Back in RailsConf Europe last year, at [David's Keynote](http://woss.name/2006/09/30/railsconf-europe-2006-first-plenary-dhh/), it was said that:

> There are unresolved decisions with respect to the restful controllers. In particular, what should the convention be for searching? A separate action? Or parameters passed to the index action?

I don't suppose a convention has been adopted for this yet?  I'm just about to implement search in an application I'm working on and I'd rather go with the 2.0 convention now, rather than fight against it with my wrong decision later. :-)

**Update** Judging by the implementation of `ActiveResource#find` it's parameters passed to index, isn't it?

**Update 2** OK, so what's the elegant, reusable implementation for `FooController#index`, turning `params` into `find(:all, :conditions => ...)`?

**Update 3** I've started codifying what I'm doing into a plugin: [resource_search](http://svn.rubaidh.com/plugins/trunk/resource_search). It's still in its infancy.
