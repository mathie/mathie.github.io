require 'jekyll-assets'
require 'bootstrap-sass/sass_functions'

# FIXME: There must be a sensible way to query Bundler or Rubygems for the root of a gem...!
bootstrap_sass_root = File.expand_path("#{$:.grep(/bootstrap-sass/).first}/..")
bootstrap_assets_root = File.join(bootstrap_sass_root, 'vendor', 'assets')

[ 'images', 'stylesheets', 'javascripts' ].each do |asset_path|
  Sprockets.append_path File.join(bootstrap_assets_root, asset_path)
end

Sass::load_paths << File.join(bootstrap_assets_root, 'stylesheets')
