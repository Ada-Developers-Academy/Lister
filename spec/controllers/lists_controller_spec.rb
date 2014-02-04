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
        
        it 'redirects to user show' do
          post :create, list: {name: "cake"}
          expect(response.status).to eq 302
        end

        it 'assigns list to current user' do
          # p User.count
          # user = create(:user)
          # session[:user_id] = user.id
          # list = create(:list)
          post :create, list: {name: "cake", user_id: session[:user_id]}
          expect(assigns(:list).user_id).to eq user.id
        end

        it 'changes list count by 1' do
          expect {post :create, list: valid_attributes }.to change(List, :count).by(1)
        end
      end

    end

    # context 'with invalid user' do
    # end


  end

end
