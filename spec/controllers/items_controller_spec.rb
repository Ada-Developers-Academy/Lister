require 'spec_helper'

describe ItemsController do

  describe "GET new" do

    it "is successful" do
      get :new
      expect(response).to be_successful
    end

  end

  describe "POST create"

    context "with valid attributes" do
      
      let(:valid_item) { {id: 1, name: "David Copperfield", list_id: 1 }}

      it "saves the item to the database" do
        expect{post :create, item: valid_item}.to change(Item, :count).by(1)
      end

      pending "response goes a place and shows a thing" 
      #Not yet sure where I want it to go or how to write it 
      #I think it might be a partial?
    end

    context "with invalid attributes" do
      let(:invalid_item) {{id: 1, name: nil, list_id: 1}}

      it "doesn't save to the database" do
        expect{post :create, item: invalid_item}.to_not change(Item, :count).by(1)
      end

      it "displays flash message" do
        post :create, item: invalid_item
        expect(flash[:notice]).to_not be_blank
      end

      pending "response goes a place and shows a thing"
      #Not sure where, what or how yet.
    end

  describe "GET edit" do
    # Having issues with let-factorygirl-symbol-thing.
    # Trying to use let instead of before like I did with lists.

    # let!(:item) { FactoryGirl.create(:item) }

    # it "finds the requested item" do
    #   get :edit, id: :item.id
    #   expect(assigns(:item).id).to eq(:item.id)
    # end

    # it "is successful" do
    #   get :edit, id: :item.id
    #   expect(response).to be_successful
    # end
  end

  describe "PATCH update" do
    # To be done after I get the edit specs reasonable
  end

  describe "DELETE destroy" do
    # To be done after I get the edit specs reasonable
  end
end
