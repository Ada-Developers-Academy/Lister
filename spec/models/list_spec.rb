require 'spec_helper'

describe List do
 let(:list) { create(:list) }
 

 describe "validates" do
    it "is valid" do
     expect(list).to be_valid
    end
  end

  it "should have a title" do
    list.update(title: nil)
    expect(list).to_not be_valid
  end
end
