module Jekyll
  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive.html')
      self.data['tag'] = tag
      self.data['posts'] = site.tags[tag]

      tag_title_prefix = site.config['tag_title_prefix'] || 'Posts tagged: '
      self.data['title'] = "#{tag_title_prefix}#{tag}"
    end
  end

  class TagPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'archive'
        dir = site.config['tag_dir'] || 'tag'
        site.tags.keys.each do |tag|
          site.pages << TagPage.new(site, site.source, File.join(dir, tag.downcase.gsub(/[^0-9a-z]+/, '-')), tag)
        end
      end
    end
  end
end
