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
      user = User.create
      # session[:user_id] = user.id
      it 'assigns list to current user' do
        list = create(:list)
        expect(list.user_id).to eq session[:user_id]
      end
    end

    context 'with invalid user' do
    end


  end

end
