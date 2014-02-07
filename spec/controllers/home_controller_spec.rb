require 'spec_helper'

describe HomeController do
  describe "GET 'index" do
     it "is successful" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @user" do
      @user = User.new
      get :index
      expect(assigns(:list)).to eq(list)
    end
  end

end
