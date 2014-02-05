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
      before do
        session[:user_id] = 1
        request.env["HTTP_REFERER"] = "where_i_came_from"
        post :create, name: "Fate-free yogurt", list_id: "1"
      end

      it "creates an item" do
        expect(Item.last.name).to eq "Fate-free yogurt"
      end

      it "redirects back" do
        expect(response).to redirect_to "where_i_came_from"
      end
    end
  end

end
