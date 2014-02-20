require 'spec_helper'

describe "List" do 
  let(:list) { create(:list)}
  describe "validates" do
    it "is valid" do
      expect(list).to be_valid
    end

    it "list needs a name" do
      list.update(name: nil)
      expect(list.errors[:name]).to include "can't be blank"
    end

    #list name. if the user has a list that already has that name, then he can't make that list. 
  end
end
