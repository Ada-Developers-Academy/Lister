require 'spec_helper'

describe ItemsController do

    describe "GET 'new'" do
      it "is successful" do
        get :new
        expect(response).to be_successful
      end
    end

    describe "POST 'create'" do
    end

    describe "GET 'edit'" do
      let(:item) { create(:item) }
        it "is successful" do
          get :edit, id: item.id
          expect(response).to be_successful
        end
    end

    describe "PATCH 'update'" do
    end

    describe "DELETE 'destroy'" do
    end

  end
