require 'spec_helper'

describe Font do
  describe "#unix_name" do
    it "should not include non word characters (apart from dashes)" do
      Font.new(name:'ariel BOLD_!"$%^&*()-=').unix_name.delete('-').should_not match(/\W+/)
    end
  end

  describe "#font_type" do
    it "identifies *.ttf fonts as truetype" do
      Font.new(filename:'ariel.ttf').font_type.should eql('truetype')
    end

    it "identifies *.otf fonts as opentype" do
      Font.new(filename:'ariel.otf').font_type.should eql('opentype')
    end
  end

  describe Font, 'to_json' do
    before(:each) { Font.make! }

    it "produces a object, which can be indexed with a fonts shell escaped name" do
      first_font = JSON.parse(Font.to_json)[Font.first.unix_name]
      first_font.should be_a_kind_of(Hash)
    end

    it "should contain the data for a font" do
      ["name", "link", "description"].each do |key|
        first_font = JSON.parse(Font.to_json)[Font.first.unix_name]
        first_font.should have_key(key)
      end
    end

    it "should leave out the timestamps" do
      first_font = JSON.parse(Font.to_json)[Font.first.unix_name]
      first_font.should_not have_key("created_at")
    end
  end
end
