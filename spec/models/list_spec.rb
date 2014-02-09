require 'spec_helper'

describe List do
 let(:list) { create(:list) }
 

 describe "validates" do
    it "is valid" do
     expect(list).to be_valid
    end
  end

  it "should be invalid with no title" do
    list.update(title: nil)
    expect(list).to_not be_valid
  end

  it "should be invalid with no user_id" do
    list.update(user_id: nil)
    expect(list).to_not be_valid
  end
end
