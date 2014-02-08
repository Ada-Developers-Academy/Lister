require 'spec_helper'

describe List do
  let(:list) { create(:list) }
  describe "validates" do
    it "is valid" do
      expect(list).to be_valid
    end
    
    it "user_id presence" do
      list.update(user_id: nil)
      expect(list.errors[:user_id]).to include "can't be blank"
    end

    it "title presence" do 
      list.update(title: nil)
      expect(list.errors[:title]).to include "can't be blank"
    end

    it "unique title for that user" do
      list1 = create(:list)
      expect{create(:list)}.to raise_error
    end

    it "title and permits the same title across multiple users" do 
      list.update(user_id: 2)
      list2 = create(:list)
      expect(list2).to be_valid
    end
  end
end
