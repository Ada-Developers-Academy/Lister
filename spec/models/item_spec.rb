require 'spec_helper' 

describe 'Item' do 
  let!(:item) { Item.create(name: 'soup')}

  describe 'validations' do 
    it 'must have a name' do 
      new_item = Item.create
      expect(book.errors[:new_item]).to include 'can\'t be blank'
    end
  end
end