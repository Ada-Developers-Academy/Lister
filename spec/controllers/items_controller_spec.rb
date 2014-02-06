require 'spec_helper'

describe ItemsController do 

  describe "get new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "create" do
    context "with valid attributes" do
    let(:valid_attributes) { {description: "milk", list_id: @list.id} }
      before do 
        @list = create(:list)
      end

      it "successfully redirects on creation" do
        post :create, item: valid_attributes
        expect(response.status).to eq 302
      end

      it "does create a list" do
        item_count = Item.count
        post :create, item: valid_attributes
        expect(Item.count).to eq(item_count + 1)
      end

      it "flashes a notice" do
        post :create, item: valid_attributes
        expect(flash[:notice]).to eq("Nice! A new item!")
      end

      it "assigns the item to current list" do
        post :create, item: valid_attributes
        expect(assigns(:item).list_id).to eq(@list.id)
      end
    end
  end
end