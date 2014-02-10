require 'spec_helper'

describe "item" do
  let(:item) { create(:item) }
  describe "validates" do
    it "is valid" do
      expect(item).to be_valid
    end

    it "content presence" do
      item.update(content: nil)
      expect(item.errors[:content]).to include "can't be blank"
    end

    it "list id presence" do
      item.update(list_id: nil)
      expect(item.errors[:list_id]).to include "can't be blank"
    end

    it "two items on a list can't be the same" do
      item2 = build(:item, content: item.content, list_id: item.list_id)
      item2.valid?
      expect(item2.errors[:content]).to include "that item is already on the list"
    end

    it "two a list can have two or more items" do
      item2 = build(:item, content: "dfghjsd", list_id: item.list_id)
      expect(item2).to be_valid
    end
  end
end