require 'spec_helper'

describe "Item" do
  let(:item1) { create(:item1) }
  describe "validations" do
    it "is valid" do
      expect(item1).to be_valid
    end

    it "has a name" do
      item1.update(name: nil)
      expect(item1.errors[:name]).to include "can't be blank"
    end

    it "must be associated with a list" do
      item1.update(list_id: nil)
      expect(item1.errors[:list_id]).to be_invalid
    end

  end
end
