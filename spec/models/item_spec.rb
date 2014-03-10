require 'spec_helper'

describe "Item" do
  let(:item) { create(:item) }
  describe "validations" do
    it "is valid" do
      expect(item).to be_valid
    end

    it "has a name" do
      item.update(name: nil)
      expect(item.errors[:name]).to include "can't be blank"
    end

    it "must be associated with a list" do
      item.update(list_id: nil)
      expect(item).to be_invalid
    end
  end

    describe "methods" do
      it "belongs to a list" do
        expect(item.list).to_not be_nil
      end
    end
end
