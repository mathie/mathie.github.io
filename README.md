# Notes from a Messy Desk

This is the latest reboot of my blog, Notes from a Messy Desk. There have been
many incarnations of my blog, and several have tried to carry over the previous
versions. This time I've decided to start afresh - at best the old content was
a bit dusty; at worst, it was downright misleading. Time for a fresh start.

You can find the new blog at <http://woss.name/> and it reflects the
[master](https://github.com/mathie/mathie.github.io/tree/master) branch.

You can find the old blog at <http://old.woss.name/> and it reflects the
[old.woss.name](https://github.com/mathie/mathie.github.io/tree/old.woss.name)
branch.

## CI Status

[ ![Codeship Status for mathie/mathie.github.io](https://www.codeship.io/projects/54843020-3d95-0132-0fb6-028472313e2c/status)](https://www.codeship.io/projects/43305)

## Bootstrap configuration

The CSS is currently a customised version of
[Bootstrap](http://getbootstrap.com/), from the Bootstrap website. To remind
myself, I deselected *all* the components (toggled off all the LESS files, and
all the jQuery plugins), then added:

* Common CSS: typography, code, grid system, forms and buttons.

* Components: Jumbotron, Thumbnails, Wells

* JavaScript components: Modals

* Utilities: Responsive utilities, Component animations

* jQuery plugins: Modals, Transitions

I haven't customised any of the LESS variables, since I figured it would be
tricky to keep track of the changes. Now that I'm keeping track of changes
here, that should be simpler. :)

## Images

I've got a clump of code to insert a thumbnail image. It's not terribly elegant
but it'll do for now.

    <figure class="thumbnail">
      <img src="/img/keyboard-preferences.png" alt="Switching off the Caps Lock key in system preferences." class="img-responsive">
      <figcaption class="caption">
        <p>
          Switching off the caps lock key in system preferences. Set the value for Caps Lock to "No Action" to completely disable its default behaviour.
        </p>
      </figcaption>
    </figure>

Customise the:

* The image `src` and `alt` tags.

* The caption..
