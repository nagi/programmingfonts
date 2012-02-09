class Language
  def self.load_yml
    YAML.load(File.open(Rails.root.join('data','languages.yml')))
  end

  def self.to_hash
    @languages ||= load_yml
  end

  def self.to_json
    @languages ||= to_hash
    @languages.to_json
  end
end
