---
layout: post
title: Google Analytics Plugin
date: 2006-05-09 15:47:21 +01:00
categories:
- Geekery
- Work
comments:
- id: 421
  author: Joakim Westin
  author_email: joakim@jwab.net
  author_url: ''
  date: !binary |-
    MjAwNi0wNS0wOSAxODoyMjoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0wOSAxNzoyMjoxMSArMDEwMA==
  content: <p>Thanks! Great little plugin!</p>
- id: 422
  author: PSousa
  author_email: froidexplica@gmail.com
  author_url: http://www.reinventar.com
  date: !binary |-
    MjAwNi0wNS0xMCAwOTo0MToxNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0xMCAwODo0MToxNCArMDEwMA==
  content: <p>Great plugin, looks very usefull. Thanks!</p>
- id: 423
  author: Kevin Ansfield
  author_email: kev@digitalblueprint.co.uk
  author_url: http://www.bn23.com
  date: !binary |-
    MjAwNi0wNS0xMCAxMToyMTo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0xMCAxMDoyMTo0MyArMDEwMA==
  content: ! '<p>Great idea!</p>


    <p>Havn''t had a chance to look at the code yet but does it handle ssl and non-ssl
    pages? (ie, switches the google analytics url to prevent non-ssl items on ssl
    pages)</p>'
- id: 424
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNS0xMCAxMzo0NDowOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0xMCAxMjo0NDowOSArMDEwMA==
  content: ! '<p>Kevin: Done. :)  I''ve not tested it, though, because I''ve not got
    a site deployed on SSL.  Could you try it out and let me know if it works OK?</p>'
- id: 425
  author: Plugs and plugins at Notes from a messy desk
  author_email: ''
  author_url: http://woss.name/2006/05/10/plugs-and-plugins/
  date: !binary |-
    MjAwNi0wNS0xMCAxNToyNTowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0xMCAxNDoyNTowMyArMDEwMA==
  content: <p>[...] Register             &laquo; Google Analytics Plugin [...]</p>
- id: 426
  author: Graham
  author_email: siener@gmail.com
  author_url: http://islostarepeat.com
  date: !binary |-
    MjAwNi0wNS0xMCAyMTo1Njo0NSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0xMCAyMDo1Njo0NSArMDEwMA==
  content: <p>Would love to try this out, but I can't get an analytics account.  Any
    chance you have an invitation code laying around?</p>
- id: 427
  author: Alex Wayne
  author_email: woss@beautifulpixel.com
  author_url: http://beautifulpixe.com
  date: !binary |-
    MjAwNi0wNS0yMyAyMDozNzo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yMyAxOTozNzo1NiArMDEwMA==
  content: ! '<p>The ssl version of the URL is wrong.</p>


    <p>It should be https://ssl.google-analytics.com/urchin.js</p>'
- id: 428
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNS0yNCAwODoyODo0OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yNCAwNzoyODo0OCArMDEwMA==
  content: ! '<p>alex: Thanks for pointing that out.  I''ve fixed it in subversion
    now.</p>'
- id: 429
  author: Kenneth Kalmer
  author_email: kenneth@clearplanet.co.za
  author_url: http://www.rubyonrailshosting.co.za
  date: !binary |-
    MjAwNi0wNi0xOCAxMToyNjozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0xOCAxMDoyNjozMyArMDEwMA==
  content: ! '<p>Great plugin! I just wanted to write my own Analytics plugins, but
    a quick Google revealed this.</p>


    <p>It might be worth pointing out that placing the configuration line in config/enviroment/production.rb
    ensures that no analytics code is present while developing.</p>


    <p>Keep up the good work!</p>'
- id: 430
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNi0xOCAxMTo0Mzo1MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0xOCAxMDo0Mzo1MyArMDEwMA==
  content: ! '<p>Kenneth: Thanks!  While placing the configuration line in <code>config/environment/production.rb</code>
    is probably more flexible (it''ll allow you to specifically configure it for any
    individual environment you use), I''ve opted for convention over configuration
    and the plugin only ever emits the Google Analytics code when the environment
    is <code>production</code> anyway.</p>'
- id: 431
  author: mummey
  author_email: mummey@gmail.com
  author_url: http://www.mummey.net
  date: !binary |-
    MjAwNi0wOC0wMyAwNjo0MjoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wMyAwNTo0MjoyMiArMDEwMA==
  content: ! "<p>I found this link and got interested since I just started using Typo.</p>\n\n<p>Only
    problem is, when I try the first step, I get this:</p>\n\n<p>ruby script/plugin
    source http://svn.rubaidh.com/plugins/trunk\n./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:301:in
    <code>&lt;&lt;': can't modify frozen string (TypeError)\n        from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:301:in</code>initialize'\n
    \       from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:220:in
    <code>add'\n        from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:530:in</code>parse!'\n
    \       from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:529:in
    <code>parse!'\n        from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:411:in</code>parse!'\n
    \       from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:427:in
    `parse!'\n        from ./script/../config/../vendor/rails/railties/lib/commands/plugin.rb:823\n
    \       from script/plugin:3</p>"
- id: 432
  author: Google Analytics plugin with typo?
  author_email: ''
  author_url: http://david.planetargon.us/articles/2006/08/08/google-analytics-plugin-with-typo
  date: !binary |-
    MjAwNi0wOC0wOCAyMTo1NTozOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wOCAyMDo1NTozOSArMDEwMA==
  content: <p>[...] Has anyone managed to get the Google Analytics Plugin that Mathie
    wrote to work with typo? [...]</p>
- id: 433
  author: the point man
  author_email: morethanpoints@gmail.com
  author_url: http://www.morethanpoints.com
  date: !binary |-
    MjAwNi0wOC0xNSAwNTo1MToyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0xNSAwNDo1MToyMyArMDEwMA==
  content: <p>I was able to follow the steps without issues - I'm attempting to get
    it to work with the Typo blog that I have setup.  Interestingly, it adds the javascript
    to the admin pages, but doesn't seem to add the javascript to the main page!</p>
- id: 434
  author: the point man
  author_email: morethanpoints@gmail.com
  author_url: http://www.morethanpoints.com
  date: !binary |-
    MjAwNi0wOC0xNSAwNjoyMTo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0xNSAwNToyMTo1MSArMDEwMA==
  content: <p>It works - I just confirmed it.  In Typo - just make sure you unload
    and reload the theme and it will show up.  Thank you very much for this.  There
    is very little out there on using google analytics - especially with the Typo
    blogging software.</p>
- id: 435
  author: Bill
  author_email: azconza@gmail.com
  author_url: http://goodwidgets.com
  date: !binary |-
    MjAwNi0xMS0yMSAwMzozNzoxNCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yMSAwMjozNzoxNCArMDAwMA==
  content: <p>Ive got a question regarding google analytics and rails. I have copied
    the code snippet from google and I have it placed in a footer that is included
    on all pages. Goole sees the script but no data is being sent. has anybody had
    this trouble? Thanks.</p>
- id: 436
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMS0yMSAwODozNzoxNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yMSAwNzozNzoxNSArMDAwMA==
  content: ! '<p>Bill: You''ve got a space between the underscore and the uacct in
    the code you''ve pasted (looking at goodwidgets.com).  Try removing the extraneous
    space, or consider just using the plugin which takes care of it all for you. :-)</p>'
- id: 437
  author: Louis
  author_email: Louis@alldj.org
  author_url: http://alldj.org
  date: !binary |-
    MjAwNi0xMi0xMiAyMTozMjo1NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0xMiAyMDozMjo1NiArMDAwMA==
  content: ! '<p>What I want to do on my blog, is every few hours take the oldest
    post and move it to the

    front of the queue, all automatically. Anyone know if there is a plugin that can
    do this or

    a simple way to set up another plugin to do this (use my own feed perhaps)?

    Thanks.</p>'
- id: 438
  author: James
  author_email: james.bebbington@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0wMyAxMzoyMjoxNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0wMyAxMjoyMjoxNyArMDAwMA==
  content: ! "<p>Hey mathie,</p>\n\n<p>I've been using this plugin and it it seems
    to work very nicely - I have come across one issue/bug though...</p>\n\n<p>When
    attempting to render an inline PDF from one of my controllers using the following
    code:</p>\n\n<p>send_file(pdf_filename, :type =&gt; document.content_type, :disposition
    =&gt; 'inline')</p>\n\n<p>The plugin barfs as it tries to do the replace on the
    body tag replace (which of course doesn't exist):</p>\n\n<p>NoMethodError (private
    method <code>gsub!' called for #&lt;Proc:0xb7863fa0&gt;):\n    /vendor/plugins/google_analytics/lib/rubaidh/google_analytics.rb:12:in</code>add_google_analytics_code'</p>\n\n<p>I
    guess the #add_google_analytics_code method just needs to be extended to catch
    that exception and ignore it.</p>\n\n<p>Cheers,\nJames.</p>"
- id: 439
  author: James
  author_email: james.bebbington@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0wMyAxMzoyNTo0MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0wMyAxMjoyNTo0MyArMDAwMA==
  content: <p>P.S. As an aside, it would also be nice to have a link to details about
    available comment formatting markup by the Leave a Reply form.</p>
- id: 440
  author: James
  author_email: james.bebbington@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0yMyAxODoxODoyNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0yMyAxNzoxODoyNiArMDAwMA==
  content: ! '<p>Here''s my monkeypatch for anyone facing the issue I mentioned above:</p>


    <p>http://attachr.com/6734</p>


    <p>I''ve stuck it in lib/patches/google_analytics/google_analytics.rb and then
    just required it from  my environment.rb. Seems to do the trick.</p>


    <p>J.</p>'
- id: 441
  author: Jeff Lawrence
  author_email: jeff@sonicko.com
  author_url: http://www.sonicko.com
  date: !binary |-
    MjAwNy0wMy0wNiAwNzoxMjoxNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMy0wNiAwNjoxMjoxNiArMDAwMA==
  content: <p>Great plug in!</p>
- id: 442
  author: patrick
  author_email: fooqri@yahoo.com
  author_url: http://noneyet
  date: !binary |-
    MjAwNy0wNC0xNCAwMDo1ODoxMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNC0xMyAyMzo1ODoxMyArMDEwMA==
  content: <p>I am having trouble getting the https to work correctly, it is outputting
    http link to Google on https pages. I followed the one simple instruction (nice!)
    to add to environment.rb and that is about it. Is there something else I need
    to do? I am using apache/mongrel_cluster/rails.</p>
- id: 443
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNC0xOCAxMTo1NzowNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNC0xOCAxMDo1NzowNiArMDEwMA==
  content: ! '<p>James: OK, only 4 month late, but I''ve finally actually used my
    GA plugin on another project so I''ve tweaked it so that it only tries to spit
    out the GA code if the response actually responds to <code>gsub!</code>.  More
    or less the same as your monkey patch but more duck-like. :)</p>


    <p>Thanks for the pointer!</p>'
- id: 444
  author: Yurii Rashkovskii
  author_email: yrashk@verbdev.com
  author_url: http://rashkovskii.com
  date: !binary |-
    MjAwNy0wOC0yNyAxNjowNToyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0yNyAxNTowNToyOSArMDEwMA==
  content: ! "<p>Graeme,</p>\n\n<p>may be it is worth checking whether format is text/html:</p>\n\n<pre><code>\nIndex:
    vendor/plugins/google_analytics/lib/rubaidh/google_analytics.rb\n===================================================================\n---
    vendor/plugins/google_analytics/lib/rubaidh/google_analytics.rb     (revision
    247)\n    vendor/plugins/google_analytics/lib/rubaidh/google_analytics.rb     (working
    copy)\n@@ -9,7  9,7 @@\n     def add_google_analytics_code\n       code = google_analytics_code(request)\n
    \      return if code.blank?\n-      response.body.gsub! '', code   '' if response.body.respond_to?(:gsub!)\n
    \      response.body.gsub! '', code   '' if request.format == 'text/html' and
    response.body.respond_to?(:gsub!)\n     end\n   end\n</code></pre>"
- id: 445
  author: Attila
  author_email: attila@onthemap.ie
  author_url: http://www.onthemap.ie
  date: !binary |-
    MjAwNy0xMS0yOSAwMjoxMjoxMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMS0yOSAwMToxMjoxMyArMDAwMA==
  content: ! "<p>Hi.  Looks like just the thing, but unfortunately it's keeling over
    at startup for me :0((.  I'm using rails 1.2.3 and it does the same thing in either
    production of development mode ...</p>\n\n<p>** Starting Rails with development
    environment...\nExiting\n/usr/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:266:in
    <code>load_missing_constant': uninitialized constant Rubaidh (NameError)\n        from
    /usr/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:452:in</code>const_missing'\n
    \       from /usr/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:464:in
    <code>const_missing'\n        from /Users/attila/src/trunk/config/environment.rb:115\n
    \       from /usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in</code>gem_original_require'\n
    \       from /usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in
    <code>require'\n        from /usr/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:495:in</code>require'\n
    \       from /usr/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:342:in
    <code>new_constants_in'\n        from /usr/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:495:in</code>require'\n
    \        ... 21 levels...\n        from /usr/local/lib/ruby/gems/1.8/gems/rails-1.2.3/lib/commands/server.rb:39\n
    \       from /usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in
    <code>gem_original_require'\n        from /usr/local/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:27:in</code>require'\n
    \       from script/server:3</p>\n\n<p>Any ideas ?.  Would be nice to use if I
    can get past this little hickup :0).</p>\n\n<p>Thanks.</p>"
- id: 446
  author: Rohan
  author_email: rohangarg@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wMS0yOCAwOTo0MjoxMiArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMS0yOCAwOTo0MjoxMiArMDAwMA==
  content: ! '<p>Hi,

    How can I test google analytics at the development stage ? In Rubaidh::GoogleAnalytics.domain_name  =
    ''example.com'', what should be the domain name in the development environment
    ?</p>'
- id: 447
  author: Marston A.
  author_email: marston@sugarstats.com
  author_url: http://www.marstononline.com
  date: !binary |-
    MjAwOC0wMi0wNCAwNDo1NTo1MSArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMi0wNCAwNDo1NTo1MSArMDAwMA==
  content: ! '<p>Is there any chance of this plugin being update to reflect the recent
    code changes to the GA code snippets?</p>


    <p>As reported here: http://www.niallkennedy.com/blog/2008/01/google-analytics-ga-js.html</p>'
- id: 448
  author: Brian
  author_email: barmstrong@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wMy0xOCAyMToyODozNSArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMy0xOCAyMToyODozNSArMDAwMA==
  content: <p>Nice work!  I'd be interested in seeing a GA plugin that could handle
    goals too.  Like a snippet you could add to a controller that was part of a goal.</p>
- id: 449
  author: David Blain
  author_email: dj_sasha@hotmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0yMSAxMjo1MjoxNiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0yMSAxMTo1MjoxNiArMDEwMA==
  content: ! "<p>Hi,</p>\n\n<p>I've took the liberty to modify your plugin so that
    it will also track ajax calls and check the content type of the response.</p>\n\n<p>Here
    it is:</p>\n\n<p>module Rubaidh # :nodoc:\n  module GoogleAnalyticsMixin\n    def
    google_analytics_code(request = nil, headers = nil, flash = nil)\n      return
    unless GoogleAnalytics.enabled?\n      GoogleAnalytics.google_analytics_code(request,
    headers, flash)\n    end</p>\n\n<pre><code># An after_filter to automatically
    add the analytics code.\ndef add_google_analytics_code\n  if response.body.index(\"&lt;/body&gt;\")\n
    \   code = google_analytics_code(request)\n    response.body.gsub! '&lt;/body&gt;',
    code + '&lt;/body&gt;' if response.body.respond_to?(:gsub!) &amp;&amp; !code.nil?\n
    \ elsif response.body.is_a? String # if an Ajax call there won't be a body tag\n
    \   code = google_analytics_code(request, headers, flash)\n    response.body &lt;&lt;
    code unless code.nil?\n  end\nend\n\n# A before_filter to automatically store
    the last accessed url in a cookie\n# so it can be retrieved form JavaScript to
    send it back to google when an\n# Ajax call was made.\ndef add_google_analytics_url\n
    \ options = { :controller =&gt; self.controller_name(), :action =&gt; self.action_name(),
    :only_path =&gt; true }.merge(params)\n  flash[:urchin] = \"\\\"#{url_for(options)}\\\"\"\nend\n</code></pre>\n\n<p>end</p>\n\n<p>class
    GoogleAnalytics\n    # Specify the Google Analytics ID for this web site.  This
    can be found\n    # as the value of +_uacct+ in the Javascript excerpt\n    @@tracker_id
    = nil\n    cattr_accessor :tracker_id</p>\n\n<pre><code># Specify a different
    domain name from the default.  You'll want to use\n# this if you have several
    subdomains that you want to combine into\n# one report.  See the Google Analytics
    documentation for more\n# information.\n@@domain_name = nil\ncattr_accessor :domain_name\n\n#
    I can't see why you'd want to do this, but you can always change the\n# analytics
    URL.\n@@analytics_url = 'http://www.google-analytics.com/urchin.js'\ncattr_accessor
    :analytics_url\n\n# I can't see why you'd want to do this, but you can always
    change the\n# analytics URL (ssl version).\n@@analytics_ssl_url = 'https://ssl.google-analytics.com/urchin.js'\ncattr_accessor
    :analytics_ssl_url\n\n# The environments in which to enable the Google Analytics
    code.  Defaults\n# to 'production' only.\n@@environments = ['development','test','production']\ncattr_accessor
    :environments\n\n# Return true if the Google Analytics system is enabled and configured\n#
    correctly.\ndef self.enabled?\n  (environments.include?(RAILS_ENV) and\n    not
    tracker_id.blank? and\n    not analytics_url.blank?)\nend\n\ndef self.google_analytics_code(request
    = nil, headers = nil, flash = nil)\n  extra_code = domain_name.blank? ? nil :
    \"_udn = \\\"#{domain_name}\\\";\\n\"\n  url = (not request.blank? and request.ssl?)
    ? analytics_ssl_url : analytics_url\n  path = \"'#{path}'\" unless path.nil?\n
    \ code = \"try {\\n_uacct = \\\"#{tracker_id}\\\";\\n#{extra_code}urchinTracker(#{flash
    ? flash[:urchin] : nil});}\\ncatch(e) {}\"\n  # OK, I'm not very bright -- I tried
    to turn this into a partial and\n  # failed miserably!  So it'll have to live
    here for now.\n  if headers &amp;&amp; headers[\"Content-Type\"].to_s.index(\"javascript\")\n
    \   # if content is javascript only (e.g. RJS), just append the javascript code
    without the html tags\n    return code\n  elsif headers.nil? || (headers[\"Content-Type\"].nil?
    || headers[\"Content-Type\"].to_s === \"text/html\")\n    # if content is blank
    or html, append the javascript code with the html tags\n    return &lt;&lt;-HTML\n
    \   &lt;script src=\"#{url}\" type=\"text/javascript\"&gt;&lt;/script&gt;\n    &lt;script
    type=\"text/javascript\"&gt;\n    //&lt;![CDATA[\n    #{code}\n    //]]&gt;\n
    \   &lt;/script&gt;\n    HTML\n  end\nend\n</code></pre>\n\n<p>end\nend</p>"
- id: 450
  author: Ganesh Mohan
  author_email: ganes_mohan99@yahoo.co.in
  author_url: ''
  date: !binary |-
    MjAwOC0xMS0wMyAxMzo0MzowMyArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0xMS0wMyAxMjo0MzowMyArMDAwMA==
  content: ! "<p>Hi,</p>\n\n<p>This url is not working. I am not able to download
    this plugin.</p>\n\n<p>Thanks &amp; Regards\n Ganesh Mohan</p>"
- id: 451
  author: Ganesh Mohan
  author_email: ganes_mohan99@yahoo.co.in
  author_url: ''
  date: !binary |-
    MjAwOC0xMS0wMyAxMzo0Mzo1OCArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0xMS0wMyAxMjo0Mzo1OCArMDAwMA==
  content: ! '<p>Hi,</p>


    <p>This url is not working. I am not able to download this plugin.</p>'
- id: 452
  author: Damian Janowski
  author_email: damian.janowski@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0xMS0xMSAyMzo1Nzo0NiArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0xMS0xMSAyMjo1Nzo0NiArMDAwMA==
  content: <p>I wrote a small script for myself a while ago that does something like
    this. Feel free to check it out. http://github.com/djanowski/google_services</p>
---
(AKA 'my first plugin')

Since the existing one from the [Plugins](http://wiki.rubyonrails.com/rails/pages/Plugins) page on the rails wiki isn't resolving correctly, I've created my own [Google Analytics](http://www.google.com/analytics/) plugin.  I got fed up adding the same chunk of code to `app/views/layouts/application.rhtml` for every new application.  So hopefully this will make things nice and easy.

To install it, add my plugin repository to your rails plugin sources:

    script/plugin source http://svn.rubaidh.com/plugins/trunk

and to install the Google Analytics plugin:

    script/plugin install google_analytics

To configure it, add the following to `config/environment.rb`:

    Rubaidh::GoogleAnalytics.tracker_id = 'UA-12345-67'

where the `tracker_id` is what `_uacct` gets set to in the chunk of javascript that Google gives you to insert.  That's it!  All configured!  Your tracking information will be inserted into every page.  If you don't want it in particular controller, you can do the usual to skip after_filters:

    skip_after_filter :add_google_analytics_code

Simple, eh?

**Update 2006/05/10** I've updated plugin so that it should automatically use the SSL version of the Google Analytics URL if it's on an SSL page (so that you don't get warnings about a mixture of secure and insecure content on a page).  I've also added support for specifying the `_udn` which you'll want to put in if you have multiple subdomains appearing on the same report.
