require 'spec_helper'

describe Item do
  describe "Validations" do

    let(:item) {create(:item)}

    it "is valid" do
      expect(item).to be_valid
    end

    it "is associated with a list" do
      item.update(list_id: nil)
      expect(item.errors[:list_id]).to include "can't be blank"
    end

    it "has a name" do
      item.update(name: nil)
      expect(item.errors[:name]).to include "can't be blank"
    end
  end
end
