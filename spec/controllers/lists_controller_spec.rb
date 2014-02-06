require 'spec_helper'
describe ListsController do
  let(:user) { create(:user) }

  describe "GET 'new'" do

    before(:each) do
      controller.instance_variable_set(:@current_user, user)
    end

    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

#Hi code reviewer! Thanks for doing this. I feel like I'm mostly just copying and adapting tests I was given, which is super useful, but also won't get me through everything. I'd love to hear about other things I should be testing.

  describe "POST 'create'" do
    context "user is logged in" do
      context "with valid attributes" do
        let(:current_user) { create(:user)}
        let(:valid_attributes) { {title: "My Best Pranks", user_id: current_user} }

        before(:each) do
          controller.instance_variable_set(:@current_user, current_user)
        end


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
        let(:current_user) { create(:user)}
        let(:invalid_attributes) { { title: "", user_id: :current_user} }

        it "renders the new template" do
          post :create, list: {title: "b"}
          expect(response).to render_template :new
        end
      
        it "does not create a list" do
          expect { post :create, list: {title: "b"} }.to change(List, :count).by(0)
        end
      end
    end
  end

  describe "GET 'new'" do
    context "when not logged in" do
      it "redirects to log in page" do
        get :new 
        expect(response.status).to eq 302
      end

      it "has a flash notice" do
        get :new 
        expect(flash[:notice]).to_not be_blank
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

  describe "DELETE 'destroy'" do
    let(:current_user) { create(:user) }
    let!(:list) { create(:list) }

    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
      list.update(user_id: current_user.id)
    end

    context "you're trying to destroy your own list" do
      it "will redirect" do
        delete :destroy, id: list.id
        expect(response).to redirect_to "/user/#{current_user.id}"
      end

      it "changes list count by -1" do
        expect { delete :destroy, id: list.id }.to change(List, :count).by(-1)
      end
    end

    context "you're not signed in as the list's owner" do
      let(:other_user) { create(:user) }
      it "cannot be destroyed if you are signed in as other user " do
        list.update(user_id: other_user.id)
        expect { delete :destroy, id: list.id }.to change(List, :count).by(0)
      end
    end
  end
end