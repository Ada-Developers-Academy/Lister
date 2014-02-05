require 'spec_helper'

describe ListsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {title: "Dogs", description: "This is a list of dogs", user_id: "1"} }
      
      it "is a redirect" do
        post :create, list: valid_attributes
        expect(response.status).to eq 302 # This is a redirect
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
        post :create, list: {title: " "}
        expect(response).to render_template :new
      end
    
      it "does not create a new list" do
        expect { post :create, list: {title: " "} }.to change(List, :count).by(0)
      end
    end
  end

  describe "GET 'show'" do
    let(:list) { create(:list) }
    it "is successful" do
      get :show, id: list.id
      expect(response).to be_successful
    end
  end

  # describe 'GET #index' do
  #   context "with valid attributes" do
  #     let(:valid_attributes) { {title: "Dogs", description: "This is a list of dogs", user_id: "1"} }

  #     it "collects list into @list" do
  #       user = create(:list)      
  #       get :index
  #       expect(assigns(:list)).to match_array [@list,user]
  #     end
  #   end
  # end

end
