---
title: Front-end Development 101
subtitle: (Part 3 of 3)
category: Programming
tags:
  - JavaScript
  - Grunt
  - Less
  - CSS
  - CoffeeScript
  - Go
---
Since I'm playing around with [Go](http://golang.org/) for back end development
on my current project, I thought I'd investigate current practices for managing
assets on the front end. This is part 2 of a rambling log of what I learned
while I was playing around. I'd recommend reading
[part 1]({{ post_url 2014-11-18-front-end-development-part-1 }}) and
[part 2]({{ post_url 2014-11-18-front-end-development-part-2 }}) for some
background if you haven't already.

## Delivering JavaScript

I've never really considered myself a JavaScript developer — I spend most of my
time in the back end, thinking of client side JS as being the kind of polish
the design team put in to improve user experience. That changed when I built a
JS-heavy application where every open browser window was essentially the
eventually consistent state of an auction room.

Fortunately, [CoffeeScript][] had my back, papering over the gnarly cracks of
JavaScript that were bound to trip me up. I've come to rather like it, so I'd
like to develop code in CoffeeScript and have it all bundled up, ready to be
delivered to browser. Let's install the [grunt coffee plugin](https://github.com/gruntjs/grunt-contrib-coffee):

    npm install --save-dev grunt-contrib-coffee

Now to configure it, add options to the `grunt.initConfig`:

{% highlight coffeescript %}
coffee:
  development:
    files: [
      expand: true,
      cwd: 'app/assets/javascripts'
      src: [ '**/*.coffee' ]
      dest: 'build/javascripts'
      ext: '.js'
    ]
{% endhighlight %}

and get Grunt to load up the tasks:

{% highlight coffeescript %}
grunt.loadNpmTasks('grunt-contrib-coffee')
{% endhighlight %}

This will compile each of the files in `app/assets/javascripts` from
CoffeeScript down to JavaScript, and spit them out in a build folder. We've got
a little more work to do before we're done, though. Let's also create a watch
job to look out for changes and automatically rebuild the JS file on demand:

{% highlight coffeescript %}
coffee:
  files: [
    "app/assets/javascripts/**/*.coffee"
  ]
  tasks: [ "coffee" ]
{% endhighlight %}

## Building everything at once

Now we're getting to the stage where I've got several tasks I need to run in
order to get everything built, which is slowing down my workflow (and, worse,
making me forget to do bits!). Let's get back to automating that. I want two
targets right now:

* `build`, which will produce all the public assets, ready to serve; and

* `dev` which will build everything at first, then watch for changes and
  rebuild them on demand.

For bonus points, if you run `grunt` without any arguments, it will look for,
and invoke, the `default` task. Let's take advantage of that so it defaults to
building all the project's assets. Add the following inside the
`grunt.initConfig()` function:

{% highlight coffeescript %}
grunt.registerTask "default", [ "build" ]
grunt.registerTask "build", [ "less", "coffee" ]
grunt.registerTask "dev", [ "build", "watch" ]
{% endhighlight %}

## Cleaning up

It's always nice to clean up after ourselves, so we know we can build the app
from a pristine environment. Grunt helpfully provides a
[`grunt-contrib-clean`](https://github.com/gruntjs/grunt-contrib-clean) plugin
that does the job. Install the plugin with:

    npm install --save-dev grunt-contrib-clean

Configure it to clean up all the results of the build and interim working files
with the following in `grunt.initConfig()`:

{% highlight coffeescript %}
clean:
  assets:
    src: [ "public/assets" ]
  build:
    src: [ "build" ]
{% endhighlight %}

and load the task:

{% highlight coffeescript %}
grunt.loadNpmTasks('grunt-contrib-clean')
{% endhighlight %}

I can now clean up all the generated files with:

    grunt clean

I've also modified the `build` task so that it cleans and rebuilds everything
from scratch:

{% highlight coffeescript %}
grunt.registerTask "build", [ "clean", "less", "coffee" ]
{% endhighlight %}

## Optimising images

I didn't set out to include this in the workflow, but having tripped across the
grunt plugin to enable it, I thought I might as well add optimised images to my
workflow, too. It's great to have high resolution image assets in the source
tree, while being able to deliver (bandwidth-) optimised versions to users in
production. So, why not?

The image optimisation plugin needs the target directory to already exist for
it to work, so I've also added a task to create all the target directories (it
doesn't hurt the JS and CSS pipelines to make sure their target folders exist,
either). Install the packages with:

    npm install --save-dev grunt-contrib-imagemin grunt-mkdir

and load their tasks as before:

{% highlight coffeescript %}
grunt.loadNpmTasks('grunt-contrib-imagemin')
grunt.loadNpmTasks('grunt-mkdir')
{% endhighlight %}

I've configured the `mkdir` task to create the `javascripts`, `stylesheets`,
and `images` folders in the `public` directory, and to create the intermediate
`build` directory, with this:

{% highlight coffeescript %}
mkdir:
  options:
    mode: '0755'
  build:
    options:
      create: [ 'build' ]
  assets:
    options:
      create: [
        'public/assets/stylesheets',
        'public/assets/javascripts',
        'public/assets/images',
      ]
{% endhighlight %}

To configure the image optimisation plugin, I've asked it to create minified
versions of all images in the `app/assets/images` folder, and put them into
`public/images` with the following task:

{% highlight coffeescript %}
imagemin:
  development:
    files: [
      expand: true
      cwd: 'app/assets/images'
      src: [ '**/*.{jpg,png,gif}' ]
      dest: 'public/assets/images'
    ]
{% endhighlight %}

And I've added extra configuration to the file watcher, so that every time an
image changes, it re-minifies them:

{% highlight coffeescript %}
images:
  files: [
    "app/assets/images/**/*.{jpg,png,gif}"
  ]
  tasks: [ "imagemin" ]
{% endhighlight %}

In principle, this will eventually get pretty slow — every time a single image
gets changed, it will regenerate all of them — but that's a problem I can solve
(by getting it to only update the images that have changed) when it becomes a
pain point.

I've changed the `build` and `dev` tasks so that they incorporate creating
directories and minifying images into the build process:

{% highlight coffeescript %}
grunt.registerTask "build", [ "mkdir", "imagemin", "less", "coffee" ]
grunt.registerTask "dev", [ "clean", "build", "watch" ]
{% endhighlight %}

Of course, all this was a distraction from figuring out how to implement
dependency management with the JavaScript. Let's tackle that next.

## Incorporating Third Party JS

This turned into a bit of a fight, so I've gone with something "easy" that will
do for now, and I can always fix it later (by which I mean, "please do
investigate, and submit pull requests!"). For now, all I'm doing is
concatenating together all the bower components that are JS dependencies, in
order, then concatenating together all my own Javascript code (converted from
CoffeeScript already) into a single JavaScript file that's served to the
browser.

The CoffeeScript plugin already has the ability to concatenate source files,
and to produce a source map. Let's tweak the existing `coffee` configuration to
do that:

{% highlight coffeescript %}
options:
  sourceMap: true
  joinExt: '.coffee'
development:
  files:
    'build/javascripts/application.js': [
      'app/assets/javascripts/**/*.coffee'
    ]
{% endhighlight %}

This will take all our CoffeeScript source and compile it down to a single
`build/javascripts/application.js`, while also creating a source map,
`build/javascripts/application.js.map`.

In order to generate the single JavaScript file that we deliver to the browser,
let's use
[`grunt-contrib-uglify`](https://github.com/gruntjs/grunt-contrib-uglify):

    npm install —save-dev grunt-contrib-uglify

and load the task into `Gruntfile.coffee`:

    grunt.loadNpmTasks('grunt-contrib-uglify')

I've configured it inside `initConfig()` with the following:

{% highlight coffeescript %}
uglify:
  options:
    sourceMap: true
    sourceMapIn: 'build/javascripts/application.js.map'
  development:
    files:
      'public/assets/javascripts/application.js': [
        'bower_components/jquery/dist/jquery.js',
        'bower_components/bootstrap/dist/bootstrap.js',
        'build/javascripts/application.js'
      ]
{% endhighlight %}

It takes the compiled coffee script code, and the distribution files from the
bower components, then produces the final application.js and its associated map
file. It's enough that I get working JS in the browser, and I get a reference
back to my source file on errors in the browser, so I'm content with that for
now.

## Summary

Perhaps I started out by asking for too much in the first place, but this
seemed harder than it needed to be! Still, I have a build pipeline which takes
version third party dependencies for CSS, images, and JavaScript, along with my
own styles, CoffeeScript, and images, and it pushes them into the browser. I'm
reasonably confident I can continue to work with the pipeline, adding new
components as I need them. At some point I'd like to figure out proper
dependency management for the JS side (like CommonJS or RequireJS or some
equivalent) so I can declare the dependencies where they're required rather
than carefully ordering the build. But it'll keep me going for now.

If you're interested in the code I wound up with (along with the story arc I
took to get there), you can find it up on GitHub:
[style\_guide](https://github.com/mathie/style_guide). If you'd like to suggest
improvements (or, better still, submit pull requests!) I'd love to hear them.

[coffeescript]: <http://coffeescript.org> (CoffeeScript: a little language that compiles into JavaScript)
