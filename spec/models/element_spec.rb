require 'spec_helper'
 
 describe "Element" do
   let(:element) { create(:element) }
   describe "validates" do
    it "is valid" do
      expect(element).to be_valid
    end
 
    it "should not be valid with no body" do
      element.update(body: nil)
      expect(element).to_not be_valid
    end
 
    it "returns an error when no body" do
      element.update(body: "")
      expect(element.errors[:body]).to include "must contain at least one character"
    end

    it "is valid with a one char body" do
      element.update(body: "a")
      expect(element).to be_valid
    end
  end
end