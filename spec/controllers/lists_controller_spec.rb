require 'spec_helper'

describe ListsController do
  let(:list) { create (:list) }

  describe "GET 'new'" do
    context "when user is not signed in" do
      it "is successful" do
        get :new
        expect(response).to redirect_to sign_in_path
      end
    end

    context "when user is signed in" do
      before do
        session[:user_id]=list.user.id
      end
      it "is successful" do
        get :new
        expect(response).to be_successful
      end
    end
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST 'create" do
    context "when user is not signed in" do
      it "redirects to sign in page" do
        post :create
        expect(response).to redirect_to sign_in_path
      end
    end

    context "when user is signed in" do
      let(:valid_attributes) {{name: "My favorite things"}}
      before do
        session[:user_id]=list.user.id
      end

      context "with valid attributes" do

         it "changes list count by 1" do
          expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
        end

        it "redirects to show list path" do
          post :create
          expect(response).to redirect_to list_path(list)
        end
      end

      context "with invalid attributes" do

        it "renders the new template" do
          post :create, list: {name: nil}
          expect(response). to render_template :new
        end

        it "does not create a list" do
           expect { post :create, list: {username: nil} }.to change(List, :count).by(0)
         end
      end
    end
  end

end
