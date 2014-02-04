require 'spec_helper'

describe List do
  let(:list){List.new(name:"To Do", user_id:1)}
  describe "validates" do
    it "is valid" do
      expect(list).to be_valid
    end

    it "must have a name" do
      list.update(name: nil)
      expect(list).to be_invalid
    end

    it "must belong to a user" do
      list.update(user_id: nil)
      expect(list).to be_invalid
    end

    it "must belong to a user" do
      expect(list).to belong_to(:user)
    end
  end
end
