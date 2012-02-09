class Font < ActiveRecord::Base

  def self.to_json
    fonts = {}
    all.each { |font| fonts[font.unix_name] = font.as_json }
    fonts.to_json
  end

  def unix_name
    name.parameterize
  end

  def font_type
    case Pathname.new(filename).extname
    when '.ttf' then 'truetype'
    when '.otf' then 'opentype'
    end
  end

  def description
    markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(super)
  end

  def as_json(options = nil)
    super(only: [:name, :description, :link])
  end
end
