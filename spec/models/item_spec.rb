require 'spec_helper'

describe Item do
  let(:item) { create(:item) }
  describe "validates" do
    it "is valid" do
      expect(item).to be_valid
    end

    it "should have a name" do
      item.update(name: nil)
      expect(item).to be_invalid
    end
  end

end
