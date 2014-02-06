require 'spec_helper'

describe ItemsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  
  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {itemname: "Do the Dishes", list_id: "1"} }
      
      it "is a redirect" do
        post :create, item: valid_attributes
        expect(response.status).to eq 302 # This is a redirect
      end
    
      it "changes item count by 1" do
        expect { post :create, item: valid_attributes }.to change(Item, :count).by(1)
      end
    
      it "sets a flash message" do
        post :create, item: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end

      it "returns http success" do
        get 'create'
        response.should be_success
      end
    end
  
    context "with invalid attributes" do
      it "renders the new template" do
        post :create, item: {title: " "}
        expect(response).to render_template :new
      end
    end
    
    it "does not create a new item" do
      expect { post :create, item: {title: " "} }.to change(Item, :count).by(0)
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe 'DELETE destroy' do

    before :each do
      @item = create(:item)
    end

    it "deletes the item" do
      expect{
        delete :destroy, id: @item
      }.to change(Item, :count).by(-1)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

end
