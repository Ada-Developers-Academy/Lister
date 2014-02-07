require 'spec_helper'

describe SessionController do
  describe "GET 'new'" do
  
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  
  end

  describe "POST 'create'" do
  
    context "when an existing user submits" do
      let(:user) { create(:user) }
      context "valid attributes" do
        it "redirects" do
          post :create, username: user.username, password: user.password
          expect(response.status).to eq 302
        end
    
        it "sets the session[:user_id] to the users id" do
          post :create, username: user.username, password: user.password
          expect(session[:user_id]).to eq user.id
        end
      
        it "sets a flash message" do
          post :create, username: user.username, password: user.password
          expect(flash[:notice]).to eq 'Successfully signed in'
        end
      end
  
      context "the wrong password" do
        it "render the new template" do
          post :create, username: user.username, password: "wrong"
          expect(response).to render_template :new
        end
    
        it "don't set the session[:user_id] to the users id" do
          post :create, username: user.username, password: "wrong"
          expect(session[:user_id]).to be_nil
        end
      
        it "sets a flash message" do
          post :create, username: user.username, password: "wrong"
          expect(flash[:notice]).to eq "Invalid username or password"
        end
      end
    end
  
    context "when a user doesn't exist yet" do
      it "renders the new template" do
        post :create, username: "I don't exist", password: "somepass"
        expect(response).to render_template :new
      end
    
      it "sets a flash message" do
        post :create, username: "I don't exist", password: "wrong"
        expect(flash[:notice]).to eq "Invalid username or password"
      end
    end
  end

  describe 'Delete #destroy' do
    context "when a user signs out" do
      let(:user) { create(:user) }

      it "the user_id in session should be nil" do
        post :create, username: user.username, password: user.password
        expect(session[:user_id]).to eq user.id
        post :destroy, user_id: user.id
        expect(session[:user_id]).to eq nil
      end

      it "the user_id in session should be nil" do
        post :create, username: user.username, password: user.password
        expect(session[:user_id]).to eq user.id
        post :destroy, user_id: user.id
        expect(flash[:notice]).to eq "Thanks for visiting! See you next time you need to make a list!"
      end
    end
  end
end
