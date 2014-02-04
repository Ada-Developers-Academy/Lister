require 'spec_helper'

describe "List" do
  let(:item1) { create(:item1) }
  describe "validates" do
    it "is valid" do
      expect(item1).to be_valid
    end
    
    it "name presence" do
      item1.update(name: nil)
      expect(item1.errors[:name]).to include "can't be blank"
    end

    it "belongs to a list"
      item1.update(list_id: nil)
      expect(item1.errors[:list_id]).to be_invalid
    end
end