require 'spec_helper'

describe List do
  let(:list) { create(:list) }
  describe "validates" do
    # list = List.create(list_name: 'to do')
    it "is valid" do
      expect(list).to be_valid
    end

    it "should have a name" do
      list.update(list_name: nil)
      expect(list).to be_invalid
    end
  end
end
