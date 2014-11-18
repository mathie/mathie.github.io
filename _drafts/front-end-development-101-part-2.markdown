---
title: Front-end Development 101
subtitle: (Part 2 of 3)
category: Programming
tags:
  - JavaScript
---
## Installing Grunt

Grunt is a task runner, which manages dependencies amongst tasks, just like
`make`. It seems to be a rite of passage that every programming language on
every platform must reinvent `make`. (I think it's something to do with an
allergic reaction to tab characters.) Let's install grunt and make it a
"development" dependency (i.e. a dependency that's only required if I'm
developing, or packaging, this application, not if I'm just running it in
production):

    npm install --save-dev grunt

This downloads and unpacks the grunt into the `node_modules` folder, and adds
it to `package.json`. In addition, in order to run the grunt command line tool,
I need to globally install the `grunt-cli` package:

    npm install -g grunt-cli

All this command line tool does is to find the version of grunt that's
associated with the `Gruntfile` it's attempting to use, then invoke it.

## Building stylesheets with Less

Since Bootstrap is developed with Less (even if there is now an automagic Sass
port for the Rails punters who like fewer dependencies), let's use that for our
own stylesheets, too. I'll use Less's import mechanism to generate a single CSS
file. Since I'm a Rails weenie, and I'm quite happy with its folder structure,
I'm looking to turn `app/assets/stylesheets/application.less` into
`public/assets/stylesheets/application.css`.

Fortunately, grunt has an officially maintained module for that, called
[`grunt-contrib-less`](https://www.npmjs.org/package/grunt-contrib-less). Let's
install that as a development dependency:

    npm install --save-dev grunt-contrib-less

Now let's configure grunt to take some of the grunt work out of producing CSS
files. The bulk of the configuration happens in the `Gruntfile`. Now this file
can either be `Gruntfile.js` or `Gruntfile.coffee`, depending on what you'd
rather write. I'm quite fond of CoffeeScript, but most of the examples are in
straight JS, so there's a fine line between paths of insanity. Let's give
CoffeeScript a go. Create `Gruntfile.coffee` with the following content:

```coffeescript
module.exports = (grunt) ->
  grunt.initConfig
    # Import package metadata from package.json, just in case it's useful.
    pkg: grunt.file.readJSON('package.json')

  grunt.loadNpmTasks('grunt-contrib-less')
```

All that remains to do is configure the less task. This code block is inserted
as part of the JS object that's passed as an argument to `grunt.initConfig()`:

```coffeescript
    # less tasks for converting less source to CSS.
    less:
      options:
        paths: [ 'bower_components' ]
      development:
        files:
          "public/assets/stylesheets/application.css": "app/assets/stylesheets/application.less"
```

It's pretty straightforward, with two things happening:

* The generated file in `public/assets/stylesheets/application.css` is
  generated from the source file, `app/assets/stylesheets/application.less`.
  (It in turn imports other files, but that's our entry point into
  {{less}}][lesscss]-land.)

* The `bower_components` folder is added to the search path.

The latter allows more sensible imports inside a less file, to be able to:

```css
@import 'bootstrap/less/bootstrap.less';
```

instead of:

```css
@import '../../../bower_components/bootstrap/less/bootstrap.less';
```

which is a bit unwieldy. I can regenerate the CSS by running `grunt less`:

    grunt less
    Running "less:development" (less) task
    File public/assets/stylesheets/application.css created: 0 B → 21.4 kB

    Done, without errors.

Reloading <http://localhost:8080/> shows up the page with the stylesheet
applied. I've got a simple set of stylesheets so far, split into a couple of
files just to prove that less is successfully importing files. First of all,
`app/assets/stylesheets/application.less`:

>     @import 'base.less';

Then `app/assets/stylesheets/base.less`:

>     // Pull in the minimal bits of Bootstrap I need right now:
>
>     // Core variables and mixins
>     @import 'bootstrap/less/mixins.less';
>     @import 'bootstrap/less/variables.less';
>
>     // Bootstrap reset
>     @import 'bootstrap/less/normalize.less';
>     @import 'bootstrap/less/print.less';
>
>     // Core CSS
>     @import 'bootstrap/less/scaffolding.less';
>     @import 'bootstrap/less/type.less';
>
>     // Customise some of the bootstrap variables.
>     @import 'variables.less';

And, finally, `app/assets/stylesheets/variables.less`:

>     @body-bg: #ccc;

I've also added `/public/assets` to my `.gitignore` so I don't accidentally
check in generated files if I can possibly avoid it.

## Watching for file changes

The trouble is that the workflow here isn't terribly elegant: every time I make
a change to a less source file, I have to run `grunt less`, wait for it to
complete, and reload the page to see the effect of the change. Let's fix that
with the grunt [watch](https://www.npmjs.org/package/grunt-contrib-watch)
plugin (another one that's officially maintained by the Grunt team). First of
all, install it:

    npm install --save-dev grunt-contrib-watch

Now to configure it, I've added the following configuration inside the
`grunt.initConfig()` arguments:

```coffeescript
    # Watch source files for changes and rebuild the associated assets
    watch:
      options:
        livereload: true
        spawn: false
      gruntfile:
        files: [ "Gruntfile.coffee"]
        options:
          reload: true
      stylesheets:
        files: [
          "app/assets/stylesheets/**/*.less",
          "bower_components/**/*.less"
        ]
        tasks: [ "less" ]
```

and load the module in the main `module.exports` method:

```coffeescript
  grunt.loadNpmTasks('grunt-contrib-watch')
```

This tells it to watch all the less files in `app/assets/stylesheets` and
`bower_components` and, if any of them change, trigger the `less` task, which
will rebuild them all. If, in future, I find this is taking too long to
complete, and that I have different entry point stylesheets for different parts
of the app, I can break this down to be more fine grained, but it'll do nicely
for now.

There's also a task in there to watch for changes to the `Gruntfile.coffee` and
reload, so I don't have to restart it manually when I'm mucking around with it.
Now start it up with:

    grunt watch

Leave that running in a terminal. It'll let you know when one or more tasks are
triggered.

The watch plugin also has built in support for [Live Reload](http://livereload.com/)
so if you've got the browser plugin installed and enabled (I'm using the
[Google Chrome Live Reload extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)
it will automatically refresh your page when the stylesheets have been rebuilt.

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

```coffeescript
    coffee:
      development:
        files: [
          expand: true,
          cwd: 'app/assets/javascripts'
          src: [ '**/*.coffee' ]
          dest: 'build/javascripts'
          ext: '.js'
        ]
```

and get Grunt to load up the tasks:

```coffeescript
  grunt.loadNpmTasks('grunt-contrib-coffee')
```

This will compile each of the files in `app/assets/javascripts` from
CoffeeScript down to JavaScript, and spit them out in a build folder. We've got
a little more work to do before we're done, though. Let's also create a watch
job to look out for changes and automatically rebuild the JS file on demand:

```coffeescript
      coffee:
        files: [
          "app/assets/javascripts/**/*.coffee"
        ]
        tasks: [ "coffee" ]
```

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

```coffeescript
grunt.registerTask "default", [ "build" ]
grunt.registerTask "build", [ "less", "coffee" ]
grunt.registerTask "dev", [ "build", "watch" ]
```

## Cleaning up

It's always nice to clean up after ourselves, so we know we can build the app
from a pristine environment. Grunt helpfully provides a
[`grunt-contrib-clean`](https://github.com/gruntjs/grunt-contrib-clean) plugin
that does the job. Install the plugin with:

    npm install --save-dev grunt-contrib-clean

Configure it to clean up all the results of the build and interim working files
with the following in `grunt.initConfig()`:

```coffeescript
    clean:
      assets:
        src: [ "public/assets" ]
      build:
        src: [ "build" ]
```

and load the task:

```coffeescript
  grunt.loadNpmTasks('grunt-contrib-clean')
```

I can now clean up all the generated files with:

    grunt clean

I've also modified the `build` task so that it cleans and rebuilds everything
from scratch:

```coffeescript
  grunt.registerTask "build", [ "clean", "less", "coffee" ]
```

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

```coffeescript
  grunt.loadNpmTasks('grunt-contrib-imagemin')
  grunt.loadNpmTasks('grunt-mkdir')
```

I've configured the `mkdir` task to create the `javascripts`, `stylesheets`,
and `images` folders in the `public` directory, and to create the intermediate
`build` directory, with this:

```coffeescript
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
```

To configure the image optimisation plugin, I've asked it to create minified
versions of all images in the `app/assets/images` folder, and put them into
`public/images` with the following task:

```coffeescript
    imagemin:
      development:
        files: [
          expand: true
          cwd: 'app/assets/images'
          src: [ '**/*.{jpg,png,gif}' ]
          dest: 'public/assets/images'
        ]
```

And I've added extra configuration to the file watcher, so that every time an
image changes, it re-minifies them:

```coffeescript
      images:
        files: [
          "app/assets/images/**/*.{jpg,png,gif}"
        ]
        tasks: [ "imagemin" ]
```

In principle, this will eventually get pretty slow — every time a single image
gets changed, it will regenerate all of them — but that's a problem I can solve
(by getting it to only update the images that have changed) when it becomes a
pain point.

I've changed the `build` and `dev` tasks so that they incorporate creating
directories and minifying images into the build process:

```coffeescript
  grunt.registerTask "build", [ "mkdir", "imagemin", "less", "coffee" ]
  grunt.registerTask "dev", [ "clean", "build", "watch" ]
```

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

```coffeescript
      options:
        sourceMap: true
        joinExt: '.coffee'
       development:
        files:
          'build/javascripts/application.js': [
            'app/assets/javascripts/**/*.coffee'
          ]
```

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

```coffeescript
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
```

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
