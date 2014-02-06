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

      before do
        post :create
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to sign_in_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to_not be_blank
      end
    end

    context "when user is signed in" do
      before do
        session[:user_id] = 1
        post :create, list: { name: "Another List", user_id: "1" }
      end

      let(:list) { List.last }

      it "creates a list" do
        expect(list.name).to eq "Another List"
      end

      it "redirects to list show page" do
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

end
