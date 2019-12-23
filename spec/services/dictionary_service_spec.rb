require 'rails_helper'

RSpec.describe DictionaryService do
  describe "def_from_api" do
    it "should extract first def from api" do
      json = JSON.parse(file_fixture("testjson.json").read)
      dictionaryservice = DictionaryService.new
      result = dictionaryservice.def_from_api(json)
      expect(result).to eq("a slender threadlike outgrowth of the epidermis of an animal; especially : one of the usually pigmented filaments that form the characteristic coat of a mammal")
    end
  end
end
