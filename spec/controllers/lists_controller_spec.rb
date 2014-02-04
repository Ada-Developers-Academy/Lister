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
      # before(:each) do
      #   user = User.create
      # end
      context 'with valid fields' do
        it 'redirects to user show' do
          expect(response.status).to eq 302
        end

        it 'assigns list to current user' do
          user = create(:user)
          session[:user_id] = user.id
          # list = create(:list)
          post :create, list: {name: "cake", user_id: session[:user_id]}
          expect(assigns(:list).user_id).to eq user.id
        end
      end

    end

    context 'with invalid user' do
    end


  end

end
