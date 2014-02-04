require 'spec_helper'

describe "List" do
  let(:list) { create(:list) }
  describe "validates" do

    it "is valid" do
      expect(list).to be_valid
    end

    it "has a title" do
      list.update(title: nil)
      expect(list.errors[:title]).to include "can't be blank"
    end

    it "is associated with a user" do
      list.update(user_id: nil)
      expect(list.errors[:user_id]).to include "can't be blank"
    end

  end
end