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
        post :create, list: {list_name: "to do"}
        expect(assigns(:list)).to be_a_kind_of(List)
      end

      it "should redirect" do
        post :create, list: {list_name: "to_do"}
        expect(response).to redirect_to(list_path(assigns(:list).id))
      end

      let(:valid_attributes) { {list_name: "to_do"} }
      it "should increase list count by 1" do
        expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "should render new template" do
        post :create, list: {list_name: nil}
        expect(response).to render_template :new
      end

      it "should render new template" do
        post :create, list: {list_name: ""}
        expect(response).to render_template :new
      end
    end

    describe "Get 'show'" do
      let(:list) { create(:list) }
      it "is successful" do
        get :show, id: list.id 
        expect(response).to be_successful
      end
    end
    
end