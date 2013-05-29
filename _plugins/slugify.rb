module Jekyll
  module SlugifyFilter
    def slugify(input)
      input.gsub(/[^0-9a-zA-Z]+/, '-')
    end
  end
end

Liquid::Template.register_filter Jekyll::SlugifyFilter
