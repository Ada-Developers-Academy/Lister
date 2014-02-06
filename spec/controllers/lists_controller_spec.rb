require 'spec_helper'

describe ListsController do
  let(:user) { create(:user) }
      
  before(:each) do
    session[:user_id] = user.id
  end

  describe 'GET new' do
    context 'if logged in' do
      it 'is successful' do 
        get :new
        expect(response).to be_successful
      end

      it 'renders new' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'if not logged in' do      
      before(:each) do
        session[:user_id] = nil
      end

      it 'redirects to list index' do
        get :new
        expect(response).to redirect_to lists_path
      end
    end

  end

  describe 'GET index' do 
    context 'if logged in' do
      it 'shows all lists' do
        list = create(:list)
        get :index
        expect(assigns(:lists)).to eq([list])
      end
    end

    context 'if not logged in' do
      before(:each) do
        session[:user_id] = nil
      end
      
      it 'shows all lists' do
        list = create(:list)
        get :index
        expect(assigns(:lists)).to eq([list])
      end
    end

  end

  describe 'GET show' do
    let(:list) { create(:list) }
    context 'if logged in' do
      it 'is successful' do
        get :show, id: list.id
        expect(response).to be_successful
      end

      it 'displays list' do
        get :show, id: list.id
        expect(assigns(:list).id).to eq list.id
      end
    end

    context 'if not logged in' do
      before(:each) do
        session[:user_id] = nil
      end

      it 'is successful' do
        get :show, id: list.id
        expect(response).to be_successful
      end

      it 'displays list' do
        get :show, id: list.id
        expect(assigns(:list).id).to eq list.id
      end
    end
  end

  describe 'POST create' do
    context 'if logged in' do
      context 'with valid user' do
        context 'with valid fields' do
          let(:valid_attributes) { { name:"cake", user_id: session[:user_id] } }
          
          it 'redirects to user show' do 
            post :create, list: valid_attributes
            expect(response).to redirect_to list_path(List.last.id)
          end

          it 'assigns list to current user' do
            post :create, list: valid_attributes
            expect(assigns(:list).user_id).to eq user.id
          end

          it 'changes list count by 1' do
            expect {post :create, list: valid_attributes }.to change(List, :count).by(1)
          end

          it "sets a flash message" do
            post :create, list: valid_attributes
            expect(flash[:notice]).to_not be_blank
          end

          it "changes user's list count by 1" do
            expect {post :create, list: valid_attributes }.to change(user.lists, :count).by(1)
          end
        end

        context 'with invalid fields' do
          let(:invalid_attributes) { {name: nil, user_id: nil} }

          it 'renders the new template' do
            post :create, list: invalid_attributes
            expect(response).to render_template :new
          end

          it 'does not create a list' do 
            expect { post :create, list: invalid_attributes }.to change(List, :count).by(0)
          end

          it 'sets a flash message' do
            post :create, list: invalid_attributes
            expect(flash[:notice]).to_not be_blank
          end
        end
      end
      # context 'with invalid user' do
      #   let(:user)
      # end
    end

    context 'if not logged in' do      
      before(:each) do
        session[:user_id] = nil
      end

      it 'redirects to list index' do
        post :create
        expect(response.status).to eq 302
      end

      it 'sets flash message' do
        post :create
        expect(flash[:notice]).to_not be_blank
      end
    end
  end

  describe 'GET edit' do
    let(:user) { create(:user) }
    let(:list) { create(:list, user_id: user.id, name: "cake")}
    
    context 'if logged in' do
      context 'as valid user' do
        before(:each) do
          session[:user_id] = user.id
        end

        it 'is successful' do
          get :edit, id: list.id
          expect(response).to be_successful
        end
      end

      context 'as invalid user' do
        let(:user) { create(:user) }
        let(:list) { create(:list, user_id: user.id, name: "cake")}
        
        before(:each) do
          session[:user_id] = 1
        end

        it 'is not successful' do
          get :edit, id: list.id
          expect(response).to_not be_successful
        end

        it 'sets flash message' do
          get :edit, id: list.id
          expect(flash[:notice]).to_not be_blank
        end
      end
    end

    context 'if not logged in' do
      before(:each) do
        session[:user_id] = nil
      end
      
      it 'redirects to list index' do
        get :edit, id: list.id
        expect(response).to redirect_to lists_path
      end

      it 'sets flash message' do
        get :edit, id: list.id
        expect(flash[:notice]).to_not be_blank
      end
    end
  end

  describe 'PATCH update' do
    let(:user) { create(:user) }
    let(:list) { create(:list, user_id: user.id, name: "cake")}
    
    context 'if logged in' do
      context 'user owns list' do
        before(:each) do
          session[:user_id] = user.id
        end

        context 'with valid attributes' do
          let(:valid_attributes) { { name:"cake", user_id: session[:user_id] } }
          
          it 'redirects to list show page' do
            patch :update, id: list.id, list: valid_attributes
            expect(response).to redirect_to list_path(list)
          end

          #add items to list test would be in item controller?
        end

        context 'with invalid attributes' do
          let(:invalid_attributes){ {name: nil} }
          
          it 'renders edit page' do
            patch :update, id: list.id, list: invalid_attributes
            expect(response).to render_template :edit
          end

          it 'sets flash message' do
            patch :update, id: list.id, list: invalid_attributes
            expect(flash[:notice]).to_not be_blank
          end

          it 'name cannot be blank' do
            patch :update, id: list.id, list: invalid_attributes
            expect(assigns(:list).errors.full_messages).to include "Name can't be blank" #why is this not passing?
          end
        end
      end

      context 'user does not own list' do
        let(:user) { create(:user) }
        let(:list) { create(:list, user_id: user.id, name: "cake")}
        
        before(:each) do
          session[:user_id] = 1
        end

        it 'is redirects to list show' do
          patch :update, id: list.id
          expect(response).to_not be_successful
        end

        it 'sets flash message' do
          patch :update, id: list.id
          expect(flash[:notice]).to_not be_blank
        end
      end
    end
    
    context 'if not logged in' do
      before(:each) do
        session[:user_id] = nil
      end

      it 'it redirects to lists index' do
        patch :update, id: list.id
        expect(response).to redirect_to lists_path
      end

      it 'sets flash message' do
        patch :update, id: list.id
        expect(flash[:notice]).to_not be_blank
      end
    end
  end

  describe 'DELETE destroy' do
    let(:list){ create(:list, user_id: user.id) }

    context 'if logged in' do
      context 'if valid user' do
        it 'redirects to lists index' do 
          delete :destroy, id: list.id
          expect(response).to redirect_to lists_path
        end
      end

      context 'if not valid user' do
        before(:each) do
          session[:user_id] = 1
        end
        it 'redirects to lists index' do
          delete :destroy, id: list.id
          expect(response).to redirect_to list_path(list.id)
        end

        it 'sets flash message' do
          delete :destroy, id: list.id
          expect(flash[:notice]).to_not be_blank
        end
      end
    end

    context 'if not logged in ' do
      before(:each) do
        session[:user_id] = nil
      end
      it 'redirects to lists_path' do
        delete :destroy, id: list.id
        expect(response).to redirect_to lists_path
      end
    end
  end

end
