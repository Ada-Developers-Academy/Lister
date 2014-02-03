require 'spec_helper'

describe ListsController do
  describe 'GET new' do
    it 'is successful' do 
      get :new
      expect(response).to be_successful
    end
  describe 'shows index' do 
    get :index
    #expect(response)
    #shows a list of all lists
  end
  end

end
