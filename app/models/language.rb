class Language
  @@all = []
  cattr_accessor :all
  attr_accessor :name, :highlighter, :snippet

  def self.load
    languages = YAML.load(File.open(Rails.root.join('data','languages.yml')))
    languages.each do |l|
      @@all << new(l['name'], l['highlighter'], l['snippet'])
    end
  end

  def initialize(name, highlighter, snippet)
    @name, @highlighter, @snippet = name, highlighter, snippet
  end
end
