require 'spec_helper'

describe ListsController do
  describe "GET 'new'" do
  
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {title: "A List About Tests"} }
      it "is a redirect" do
        post :create, list: valid_attributes
        expect(response.status).to eq 302
      end
    
      it "changes list count by 1" do
        expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
      end
    
      it "sets a flash message" do
        post :create, list: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end
  
    context "with invalid attributes" do
      it "renders the new template" do
        post :create, list: {title: ""}
        expect(response).to render_template :new
      end
    
      it "does not create a list" do
        expect { post :create, list: {title: ""} }.to change(List, :count).by(0)
      end
    end
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end
  end

end
