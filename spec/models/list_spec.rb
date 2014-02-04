require 'spec_helper'

describe "List" do
  let(:list) { create(:list) }
  describe "validates" do
    it "is valid" do
      expect(list).to be_valid
    end
    
    it "name presence" do
      list.update(name: nil)
      expect(list.errors[:name]).to include "can't be blank"
    end

    it "belongs to a user"
      list.update(user_id: nil)
      expect(list.errors[:user_id]).to be_invalid
    end
end