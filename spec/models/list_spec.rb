require 'spec_helper' do 

describe 'List' do 
  let(:list) { create(:list)}

  describe 'validations' do 
    it' must have a name' do 
      list = List.create
      expect(book.errors[:name]).to include 'can\'t be blank'
    end

    it 'has a unique name' do 
      invalid_list = List.new(name: 'Groceries')
      expect(invalid_list.valid?).to eq false
      expect(invalid_list.errors[:name]).to include 'name has already been taken'
    end
  end
end