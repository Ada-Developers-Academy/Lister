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

    it 'should have a user_id' do
      list.update(user_id: nil)
      expect(list).to be_valid
    end
  end
end
