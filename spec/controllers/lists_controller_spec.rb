require 'spec_helper'

describe ListsController do
  describe 'GET new' do
    it 'is successful' do 
      get :new
      expect(response).to be_successful
    end

    #rendering partials?
    # it 'renders form' do
    #   get :new
    #   expect(response).to render_template('form')
    # end
  end

  describe 'GET index' do 
    it 'shows all lists' do
      list = create(:list)
      get :index
      expect(assigns(:lists)).to eq([list])
    end
  end

  describe 'GET show' do
    it 'is successful' do
      create(:list)
      get :show, id: List.last.id
      expect(response).to be_successful
    end

    it 'displays list' do
      list = create(:list)
      get :show, id: list.id
      expect(assigns(:list).id).to eq list.id
    end
  end

  describe 'POST create' do
    context 'with valid user' do
      let(:user) { create(:user) }
      
      before(:each) do
        session[:user_id] = user.id
      end

      context 'with valid fields' do
        let(:valid_attributes) { {name:"cake", user_id: session[:user_id]} }
        
        it 'redirects to user show' do #should be list show? how to specify route name?
          post :create, list: valid_attributes
          # expect(response.status).to eq 302
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

    context 'with user who is not signed in' do      
      
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

end
