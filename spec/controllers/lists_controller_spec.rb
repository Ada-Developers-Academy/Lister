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

      let(:current_user) { create(:user)}

      before(:each) do
        session[:user_id] = current_user.id
        post :create, list: { name: "Another List", user_id: "1" }
      end

      let(:list) { assigns(:list) }

      it "creates a list" do
        expect(list.name).to eq "Another List"
      end

      it "redirects to list show page" do
        expect(response).to redirect_to list_path(list.id)
      end
    end

    context "when user doesn't exist in database" do

      before(:each) do
        session[:user_id] = "A"
        post :create, list: { name: "Another List", user_id: "1" }
      end

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to_not be_blank
      end

      it "resets session" do
        
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
