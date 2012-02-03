require 'spec_helper'

describe "Font Viewing Page" do

  before(:each) do
    Font.make!
    visit '/fonts/1?language=java'
  end

  it "should display the font name " do
    page.should have_content 'Inconsolata'
  end

  it "should display the progarmming language used in the example" do
    page.should have_content 'Java'
  end
end
