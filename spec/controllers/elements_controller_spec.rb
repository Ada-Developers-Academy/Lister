require 'spec_helper'

describe ElementsController do

  describe "POST 'create'" do
    # context with valid attributes 
      let(:user) { create(:user) } 
        it "is successful" do
          post :create
          expect(response).to be_successful
        end

        it "increases the element count by 1" do
        end

        it "sets a flash message" do
        end

   #   context with invalid attributes
      it "is not successful" do
      end

      it "does not increase the element count by 1" do
      end

      it "sets a flash message" do
      end
    end
  describe "POST 'destroy" do
  end
end
