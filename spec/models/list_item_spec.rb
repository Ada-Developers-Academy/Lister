require 'spec_helper'

describe ListItem do
  describe 'validations' do
    let(:list_item) { create(:list_item)}
    it 'is valid' do
      expect(list_item).to be_valid
    end
    
    it 'should have a description' do
     list_item.update(description: nil)
      expect(list_item).to be_invalid
    end

    it 'should have a list_id' do
      list_item.update(list_id: nil)
      expect(list_item).to be_invalid
    end
  end
end
