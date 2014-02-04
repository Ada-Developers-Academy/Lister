require 'spec_helper'

describe WelcomeController do
  it "renders the index page" do
    get :index
    expect(response).to be_successful
  end
end