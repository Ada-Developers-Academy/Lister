require 'spec_helper'

describe ListItemsController do
   describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end
end
