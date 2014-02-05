require 'spec_helper'

describe ListsController do

  describe "new" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end  
  end

  describe "create" do
    context "with valid name" do
    let(:valid_attributes) { {name: "groceries", user_id: 4} }
        
      it "successfully redirects on creation" do
        post :create, list: valid_attributes
        expect(response.status).to eq 302
      end

      it "does create a list" do
        list_count = List.count
        post :create, list: valid_attributes
        expect(List.count).to eq(list_count + 1)
      end

      it "flashes a notice" do
        post :create, list: valid_attributes
        expect(flash[:notice]).to eq("You have created a new list.")
      end
    end

    context "without a valid name" do
      let(:invalid_attributes) { {name: "", user_id: 4} }

      it "renders the new template" do
        post :create, list: invalid_attributes
        expect(response).to render_template :new
      end

      it "doesn't create a list" do
        list_count = List.count
        post :create, list: invalid_attributes
        expect(List.count).to eq(list_count)
      end
    end
  end

  describe "shows the list" do
    let(:list) { create(:list) }

    it "get SHOW" do
      get :show, id: list.id
      expect(response).to be_successful
    end
  end
end