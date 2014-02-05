require 'spec_helper'

describe List do
 let(:list) { create(:list) }
 

 describe "validates" do
    it "is valid" do
     expect(list).to be_valid
    end
  end
end
