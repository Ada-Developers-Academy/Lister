require 'spec_helper'

describe WelcomeController do
  context "GET 'index'" do
    
      it "is successful" do
        get :index
        expect(response).to be_successful
      end

    it 'has a list of all the users lists' do
      list = create(:list)
      list1 = create(:list1)
      list2 = create(:list2)
      get :index
      expect(assigns(:lists)).to match_array([list,list1,list2])
    end

    it 'loads all the list titles in the view' do
        list = create(:list)
        list1 = create(:list1)
        list2 = create(:list2)
        get :index
        expect(response.body).to include(list.title)
        expect(response.body).to include(list1.title)
        expect(response.body).to include(list2.title)
      end

    it 'loads all the list descriptions in the view' do
      list = create(:list)
      list1 = create(:list1)
      list2 = create(:list2)
      get :index
      expect(response.body).to include(list.description)
      expect(response.body).to include(list1.description)
      expect(response.body).to include(list2.description)
    end
  end
end
