require 'spec_helper'

describe ItemsController do

  let(:item) { create(:item) }

  describe "POST 'create'" do

    context "when user is not signed in" do
      before do
        post :create
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to sign_in_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to_not be_blank
      end
    end

    context "when user is signed in" do

      let(:current_user) { create(:user)}

      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
        post :create, item: { name: "Fate-free yogurt", list_id: "1" }
      end

      it "creates an item" do
        expect(Item.last.name).to eq "Fate-free yogurt"
      end

      it "redirects to list show page" do
        expect(response).to redirect_to list_path(assigns(:item).list_id)
      end
    end
  end

end
