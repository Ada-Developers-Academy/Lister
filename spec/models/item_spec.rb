require 'spec_helper'

describe "Item" do
  let(:item) { create(:item) } 

  describe "validations" do
    it "is valid" do  
      expect(item).to be_valid
    end

    it "item needs a description" do
      item.update(description: nil)
      expect(item.errors[:description]).to include "can't be blank"
    end
  end
end

