require 'spec_helper'

describe Language do
  describe Language, ".to_hash" do
    it "should return an Hash" do
      Language.to_hash.should be_a_kind_of(Hash)
    end
    
    it "should contain one element for each language" do
      Language.to_hash.length.should == Language.all.length
    end

    it "should contain an elements with the shell escaped name of each language" do
      hash = Language.to_hash
      Language.all.each do |language|
        hash[language.unix_name].should be_present
      end
    end
  end

  describe Language, ".all" do
    it "should return an enumerable list of languages after loading" do
      Language.all.should be_a_kind_of(Array)
    end

    it "should return some languages in the list" do
      Language.all.length.should >= 3
    end
  end

  describe "#unix_name" do
    it "should not include non word characters" do
      Language.new('Java&^"$%&^','','').unix_name.should_not match(/\W+/)
    end
  end
end
