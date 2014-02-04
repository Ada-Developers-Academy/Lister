require 'spec_helper'

describe ListsController do

  describe "GET 'index'" do
    it "is successful" do
        get :index
        expect(response).to be_successful
      end
  end

    describe "GET 'new'" do
      it "is successful" do
        get :new
        expect(response).to be_successful
      end
    end

    describe "POST 'create'" do
    end

    describe "GET 'show'" do
      it "is successful" do
        get :index
        expect(response).to be_successful
      end
    end

    describe "GET 'edit'" do
      it "is successful" do
        get :index
        expect(response).to be_successful
      end
    end

    describe "PATCH 'update'" do
    end

    describe "DELETE 'destroy'" do
    end

  end
