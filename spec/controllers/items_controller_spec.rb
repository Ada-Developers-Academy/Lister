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

  describe "POST 'create'"
    it "assigns a item instance to @item" do
      post :create, item: { name: "laundry" }
      expect(assigns(item)).to be_an_instance_of(Item)
    end


end
