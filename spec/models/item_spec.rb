require 'spec_helper'

describe Item do 
  let(:list){ create(:list) }
  let(:item){ create(:item) }
  describe "validates" do
    describe "with valid attributes" do
      it "successfully" do
        expect(item).to be_valid
      end
    end
    describe "with invalid attributes" do
      it "requires a name" do 
        item.update(name: nil)
        expect(item.errors[:name]).to include "can't be blank"
      end
    end
  end
end