require 'spec_helper'

describe ItemsController do

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end

    it "should be an item instance" do
      get :new
      expect(assigns(:item)).to be_an_instance_of(Item)
    end
  end

  describe "POST 'create'" do
    let(:list) {create :list}
    it "assigns an item instance to @item" do
      post :create, item: { name: "laundry", list_id: list.id}
      expect(assigns(:item)).to be_an_instance_of(Item)
    end

    let(:valid_attributes) { { name: "laundry", list_id: list.id} }
    it "should increase the item count by 1" do
      expect { post :create, item: valid_attributes}.to change(Item, :count).by(1)  
    end  

    it "should redirect after save" do
      post :create, item: {name: "to do", list_id: list.id}
      expect(response.status).to eq(302)
    end
  end


  describe "GET 'show'" do
    it "is successful" do
      get :show
      expect(response).to be_successful
    end
  end
end


