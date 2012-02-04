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

  def self.to_hash
    hash = {}
    @@all.each do |l|
      hash[l.unix_name] = { name: l.name, highlighter: l.highlighter, snippet: l.snippet }
    end
    hash
  end

  def self.to_json
    # TODO; Investigate why my array is dissappearing now & then - Gargabe Collector? Superclass redefines @@all?
    load if @@all.empty?
    to_hash.to_json
  end

  def initialize(name, highlighter, snippet)
    @name, @highlighter, @snippet = name, highlighter, snippet
  end

  def unix_name
    @name.parameterize
  end
end
