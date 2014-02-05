require 'spec_helper'


describe "Element" do  
  describe "validations" do
    # it "is valid" do
    #   expect(Element.new).to be_valid
    # end

    it "should have a body" do
      expect(Element.new(body: "")).to_not be_valid
    end

    # it "body has at least one char" do
    #   element = Element.new
    #   element.update(body: "")
    #   expect(element.errors[:body]).to include "must contain at least one character"
    # end
  end


# require 'spec_helper'
 
#  describe "Element" do
   let(:element) { create(:element) }
   describe "validates" do
     it "is valid" do
       expect(element).to be_valid
     end
 
#      it "should have a body"
#        element.update(body: nil)
#        expect(element).to_not be_valid
#      end
 
#      it "body has at least one char" do
#        element.update(body: "b.com")
#        expect(element.errors[:body]).to include "must contain at least one character"
#      end
#    end
  end
end