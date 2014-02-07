require 'spec_helper'

describe ItemsController do 
  describe "create" do
    let(:current_user) { create(:user) }
    let(:list) { create(:list, user_id: current_user.id) }
    let(:valid_attributes) { {description: "milk", list_id: list.id} }

    before do 
      session[:user_id] = current_user.id
    end

    context "with valid attributes" do
      it "successfully redirects on creation" do
        post :create, item: valid_attributes
        expect(response.status).to eq 302
      end

      it "does create a item" do
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
        expect(assigns(:item).list_id).to eq(list.id)
      end
    end

    context "without valid attributes" do

      it "renders the new form if description is blank" do
        valid_attributes[:description] = nil
        post :create, item: valid_attributes
        expect(response).to be_redirect
      end

      it "redirects to root if no list found" do
        valid_attributes[:list_id] = nil
        post :create, item: valid_attributes
        expect(response).to redirect_to(root_path)
      end

      it "does not make an item" do
        valid_attributes[:description] = nil
        item_count = Item.count
        post :create, item: valid_attributes
        expect(Item.count).to eq(item_count)
      end
    end
  end
end