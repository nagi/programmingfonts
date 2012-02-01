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
end
