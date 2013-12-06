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

I've got a clump of code to insert a thumbnail image, which then expands to a
full size image in a lightbox style modal. It's not terribly elegant -- I could
probably tidy it up to automatically generate the modal in JS based on the
thumbnail itself. But it'll do for now.

    <div class="row">
      <div class="col-sm-10 col-sm-offset-1">
        <a href="#kitten-lightbox" data-toggle="lightbox" class="thumbnail text-muted text-center" title="Click for a larger version.">
          <img src="http://placekitten.com/g/1024/768" alt="Kittens!">
          <small>Click for a larger version.</small>
        </a>
      </div>
    </div>

    <div id="kitten-lightbox" class="lightbox fade" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="lightbox-dialog">
        <div class="lightbox-content">
          <img src="http://placekitten.com/g/1024/768" alt="Kittens!">
          <div class="lightbox-caption">
            Cute Kittens.
          </div>
        </div>
      </div>
    </div>

Customise the:

* anchor link fragment and id of the lightbox.

* The image `src` and `alt` tags (in both places).

* The caption inside the lightbox.
