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

    #Look what I figured out!
    it "two users lists can't have the same title" do
      list2 = build(:list, title: list.title, user_id: list.user_id)
      list2.valid?
      expect(list2.errors[:title]).to include "another of your lists has that title"
    end
  end
end