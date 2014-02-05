require 'spec_helper'

describe "Element" do  
  describe "validations" do
    it "is valid" do
      expect(Element.new(list_id: 1, body: "test body")).to_not be_valid
    end

    it "should have a body"
      expect(Element.new(list_id: 1, body: nil)).to_not be_valid
    end

    it "body has at least one char" do
      expect(Element.new(list_id: 1, body: "")).to_not be_valid
      # expect(element.errors[:body]).to include "must contain at least one character"
    end
  end

