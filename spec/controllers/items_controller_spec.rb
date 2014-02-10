require 'spec_helper'

describe ItemsController do
  let(:item) { create(:item) }

  describe "POST 'create'" do

    context "when user is signed in" do
      let(:valid_attributes) {{name: "I am an item"}}
      before do
        session[:user_id] = item.list.user.id
      end

      context "with valid attributes" do

        it "changes items count by 1" do
          expect {post :create, item: valid_attributes, list_id: item.list.id }.to change(Item, :count).by(1)
        end

        it "redirects to list show page" do
          post :create, item: valid_attributes, list_id: item.list
          expect(response).to redirect_to list_path(item.list)
        end
      end

      context "with invalid attributes" do

        it "does not change items count by 1" do
          expect {post :create, item: {name: nil}, list_id: item.list.id }.to change(Item, :count).by(0)
        end

        it "renders the new template" do
          post :create, item: {name: nil}, list_id: item.list.id
          expect(response).to render_template :new
        end
      end
    end
  end
end
