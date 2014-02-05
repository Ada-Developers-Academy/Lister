require 'spec_helper'
describe ListsController do
  
  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

#Hi code reviewer! Thanks for doing this. I feel like I'm mostly just copying and adapting tests I was given, which is super useful, but also won't get me through everything. I'd love to hear about other things I should be testing.

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {title: "My Best Pranks", user_id: 1} }
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
        post :create, list: {title: "b"}
        expect(response).to render_template :new
      end
    
      it "does not create a list" do
        expect { post :create, list: {title: "b"} }.to change(List, :count).by(0)
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

#Below are tests that aren't mimicking other tests directly. Will they work?

  describe "DESTROY 'destroy'" do
    let(:list) { destroy(:list) }
    it "is successful" do
      #Will this syntax work? I don't really know how to call an action on a different controller.
      get user/:id, id: current_user.id
      expect(response).to be_successful
    end

    it "changes list count by 1" do
      #Could this number be positive? Is something being one less still changing by 1?
      expect { delete :destroy, list: valid_attributes }.to change(List, :count).by(-1)
    end

    #Pretty sure this will not work even a little, but I'm so unsure on how to talk about other models/controllers than the one I'm in, that feedback will be helpful.
    it "cannot be destroyed someone who is not the user that created it" do
      session[:id] = 2
      expect { delete :destroy, list: valid_attributes }.to change(List, :count).by(0)
    end
  end
end