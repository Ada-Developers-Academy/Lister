require 'spec_helper'

describe ListsController do

  let(:list) { create(:list) }

  describe "GET 'index'" do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET 'new'" do
    it 'is successful' do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST 'create'" do
    context "when user is not signed in" do
      it "redirects to sign in page" do
        post :create
        expect(response).to redirect_to sign_in_path
      end
    end

    context "when user is signed in" do
      before do
        session[:user_id] = 1
      end

      it "creates a list" do
        post :create, name: "Another List"
        list = List.last
        expect(list.name).to eq "Another List"
        expect(response).to redirect_to list_path(list.id)
      end
    end
  end

  describe "GET 'show'" do
    it 'is successful' do
      get :show, id: list.id
      expect(response).to be_successful
    end
  end

  describe "GET 'edit'" do
    it 'is successful' do
      get :edit, id: list.id
      expect(response).to be_successful
    end
  end

  describe "PATCH 'update'" do
  end

  describe "DELETE 'destroy'" do
  end
end
