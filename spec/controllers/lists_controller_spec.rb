require 'spec_helper'

describe ListsController do

    describe "GET 'new'" do
  
      it "is successful" do
        get :new
        expect(response).to be_successful
      end
    end

    describe "POST 'create'" do 

      it "assigns a list instance to @list" do
        post :create, list: {list_name: "to_do"}
        expect(assigns(:list)).to be_a_kind_of(List)
      end

      it "should redirect" do
        post :create, list: {list_name: "to_do"}
        expect(response).to redirect_to(list_path(assigns(:list).id))
      end
    end
    
end