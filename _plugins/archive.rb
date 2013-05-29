module Jekyll
  class ArchivePage < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive.html')
      self.data['posts'] = site.posts
      self.data['title'] = "Archive"
    end
  end

  class ArchivePageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'archive'
        dir = site.config['archive_dir'] || 'archive'
        site.pages << ArchivePage.new(site, site.source, dir)
      end
    end
  end
end
