require 'spec_helper'

describe ListsController do
  context "when a user is signed in" do
    before do 
      @current_user = create(:user)
      session[:user_id] = @current_user.id
    end

    describe "new" do
      it "is successful" do
        get :new
        expect(response).to be_successful
      end  
    end

    describe "create" do
      context "with valid attributes" do
      let(:valid_attributes) { {name: "groceries"} }
          
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

        it "assigns the list to current_user" do
          post :create, list: valid_attributes
          expect(assigns(:list).user_id).to eq(@current_user.id)
        end
      end

      context "without valid attributes" do
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

    describe "doesn't create" do
      let(:list) { create(:list) }

      it "get SHOW" do
        get :show, id: list.id
        expect(response).to be_successful
      end
    end
  end

  context "when a user is NOT signed in" do
    let(:other_user) { create(:user) }
    before(:each) do 
      @current_user = create(:user)
      session[:user_id] = nil
    end

    describe "get new" do
      it "is a redirect" do
        get :new
        expect(response.status).to eq(302) 
      end

      it "gets a notice to sign-in first" do
        get :new
        expect(flash[:notice]).to eq("Please sign-in first.")
      end
    end
  end
end