require 'spec_helper'

describe Language do
  describe Language, ".all" do

    before(:all) { Language.load }

    it "should return an enumerable list of languages after loading" do
      Language.all.should be_a_kind_of(Array)
    end

    it "should list some languages" do
      Language.all.length.should >= 3
    end
  end
end
