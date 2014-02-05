require 'spec_helper'
describe ListsController do
  let(:user) { create(:user) }
  describe "GET new" do 
    it "is successful" do 
      get :new
      expect(response).to be_successful
    end
  end
  describe "POST create" do 
    context "with valid attributes" do

      let(:current_user) { create(:user)}
      let(:valid_attributes) { { title: "Valid Title" } }

      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end

      it "redirects" do
        post :create, list: valid_attributes
        expect(response.status).to eq 302
      end

      it "increases the list count by 1" do 
        expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
      end

      it "increases the list count for the current user by 1" do 
        expect { post :create, list: valid_attributes }.to change(current_user.lists, :count).by(1)
      end
    end

    context "with invalid attributes" do
      let(:current_user) { create(:user)}
      let(:invalid_attributes) { { title: ""} }

      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end
      it "renders the new template" do
        post :create, list: invalid_attributes
        expect(response).to render_template :new
      end
    
      it "does not create a list" do
        expect { post :create, list: invalid_attributes }.to change(List, :count).by(0)
      end
    end

    context "without a current user" do
      let(:valid_attributes) { { title: "Valid Title" } }

      it "does not create a list" do
        expect { post :create, list: valid_attributes }.to change(List, :count).by(0)
      end

      it "redirects to the new user template" do
        post :create, list: valid_attributes
        expect(response).to redirect_to new_user_path
      end
    end
  end
end
