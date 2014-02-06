require 'spec_helper' 

describe 'List' do 
  let(:list) { List.new(name: 'Groceries')}

  describe 'validations' do 
    it' must have a name' do 
      new_list = List.create
      expect(new_list.errors[:name]).to include 'can\'t be blank'
    end

    it 'has a unique name' do 
      invalid_list = List.new(name: 'Groceries')
      expect(invalid_list.valid?).to eq false
      expect(invalid_list.errors[:name]).to include 'name has already been taken'
    end
  end
end