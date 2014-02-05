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
      let(:user) { create(:user) }
      before do 
        session[:user_id] = user.id
      end
      let(:valid_attributes) { {title: "Cool List", description: "A really cool list of stuff."} }

      it "is a redirect" do
        post :create, list: valid_attributes
        expect(response.status).to eq 302 # This is a redirect
      end
    
      it "changes user count by 1" do
        expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
      end
    
      it "sets a flash message" do
        post :create, list: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end

      it 'should set a user_id' do
        post :create, list: valid_attributes
        # list = assigns(:list)
        expect(assigns(:list).user_id).to eq(user.id)
      end
    end
  
    context "with invalid attributes" do
      it "renders the new template" do
        post :create, list: { title: nil }
        expect(response).to render_template :new
      end
    
      it "does not create a list" do
        expect { post :create, list: {title: nil} }.to change(List, :count).by(0)
      end
    end
  end

  describe "GET 'show'" do
    let(:list) { create(:list) }
     it 'should work' do
      get :show, id: list.id
      expect(response.status).to eq 200
     end

     it 'should be that list' do 
      list1 = create(:list1)
      list2 = create(:list2)
      get :show, id: list.id
      expect(assigns(:list)).to eq list
   end
 end
end
