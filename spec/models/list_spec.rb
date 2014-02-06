require 'spec_helper'

describe "List" do
  let(:user) {create(:list)}
  describe "validates" do
    it "is valid" do
      expect(user).to be_valid
    end

    it "is invalid without a title" do
      expect(List.new(title: nil)).to have(1).error_on(:title)
    end

    it "is invalid without a user id" do
      expect(List.new(user_id: nil)).to have(1).error_on(:user_id)
    end
  end
end

