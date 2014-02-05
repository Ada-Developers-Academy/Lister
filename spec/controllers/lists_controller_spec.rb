require 'spec_helper'

describe ListsController do

  describe "GET 'index'" do
    it "is successful" do
        get :index
        expect(response).to be_successful
      end
  end

    describe "GET 'new'" do
      it "is successful" do
        get :new
        expect(response).to be_successful
      end
    end


    describe "POST 'create'" do

      context "when user is not signed in" do
        it "redirects to signin page" do
        post :create
        expect(response).to redirect_to sign_in_path
      end
    end

    context "when user is signed in" do
      before do
        user = create(:user)
        session[:user_id] = user.id
      end

      it "creates new list" do
        post :create, name: "Heyho"
        list = List.last
        expect(list.name).to eq "Heyho"
        expect(response).to redirect_to list_path(list.id)
      end
    end
  end

    describe "GET 'show'" do
      let(:list) { create(:list) }
        it "is successful" do
          get :show, id: list.id
          expect(response).to be_successful
       end
    end

    describe "PATCH 'update'" do
    end

    describe "DELETE 'destroy'" do
    end
  end
