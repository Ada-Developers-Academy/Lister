require 'spec_helper'

describe "item" do
  let(:item){ create(:item) }
  describe "validates" do
    it "is valid" do
      expect(item).to be_valid
    end

    it "must have a name" do
      item.update(name: nil)
      expect(item).to be_invalid
    end

    it "must belong to a list" do
      item.update(list_id: nil)
      expect(item).to be_invalid
    end
  end
end
