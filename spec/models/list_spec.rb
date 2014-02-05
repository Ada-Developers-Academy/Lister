require 'spec_helper'

describe List do
  describe 'validations' do
    let(:list) { create(:list)}
    it 'is valid' do
      expect(list).to be_valid
    end
    
    it 'should have a title' do
      list.update(title: nil)
      expect(list).to be_invalid
    end

    it 'should have a description' do
      list.update(description: nil)
      expect(list).to be_invalid
    end
  end
end
