require 'spec_helper'

describe "Home Page" do
  before(:each) { visit '/' }

  it "has a title" do
    page.should have_xpath('//title', :text => 'Programming Fonts')
  end

  it "has a list of fonts" do
    page.should have_xpath('//ol', :class => 'fonts')
  end
end
