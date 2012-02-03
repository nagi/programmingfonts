class Font < ActiveRecord::Base
  def unix_name
    name.parameterize
  end

  def font_type
    case Pathname.new(filename).extname
    when '.ttf' then 'truetype'
    when '.otf' then 'opentype'
    end
  end

  def as_json(options)
    super(only: [:name, :description]).merge(:unix_name => unix_name)
  end
end
