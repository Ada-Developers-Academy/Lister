require 'spec_helper'

describe List do
  it "has no lists in the database" do
    expect(List).to have(:no).records
    expect(List).to have(0).records
  end

  context 'when new list is created' do
    let(:user){ create(:user) }
    let(:list){ create(:list, user_id: user.id) }

    it "has one record" do
      create(:list) #need this, but then what's the point of the let in the beginning of this context scope?
      expect(List).to have(1).record
    end

    it 'belongs to a user' do
      expect(list.user.id).to eq user.id
      expect(user.lists).to include list
    end

    # it "adds items" do
    #   build(:list)
    #   list.item_name = "banana"
    #   p list.item_name
    #   expect(list.items).to_not be_empty
    # end
    # WHY WON'T THIS WORK

  end
end
