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
end
