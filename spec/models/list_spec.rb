require 'spec_helper'

describe "List" do
  let(:list) { create(:list) }
  describe "validates" do
    it "is valid" do
      expect(list).to be_valid
    end

    it "title presence" do
      list.update(title: nil)
      expect(list.errors[:title]).to include "can't be blank"
    end

    it "user id presence" do
      list.update(user_id: nil)
      expect(list.errors[:user_id]).to include "can't be blank"
    end

    it "user title combo is unique" do
      list2 = build(:list, title: list.title, user_id: list.user_id)
      list2.valid?
      expect(list2.errors[:title]).to include "another of that user's lists has that title"
    end
  end
end