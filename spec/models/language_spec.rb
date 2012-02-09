describe Language do
  describe Language, ".to_json" do
    it "should call load on first run" do
      mock(Language).load_yml
      Language.to_json
    end

    it "should return some languages in the list" do
      JSON.parse(Language.to_json).length.should >= 3
    end
  end
end
