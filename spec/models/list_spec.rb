require 'spec_helper'

describe List do
  describe 'validations' do
    let(:list) { List.create(title: 'I am a title', description: 'I am a description')}
    it 'is valid' do
      expect(list).to be_valid
    end
    
    it 'should have a title' do
      list.title = nil
      expect(list).to be_invalid
    end

    it 'should have a description' do
      list.description = nil
      expect(list).to be_invalid
    end
  end
end
