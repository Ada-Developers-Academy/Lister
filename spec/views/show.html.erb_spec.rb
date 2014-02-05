require 'spec_helper'

describe 'users/show' do 
  let(:list)  { create(:list, user_id: 1) }
  let(:list2) { create(:list, title: "The Second List") }
  let(:current_user) { create(:user)}
  before(:each) do
    controller.instance_variable_set(:@current_user, current_user)
  end
  # just wrote this because this is the first list I have ever written for a view
  it 'actually tests the view' do
    render
    rendered.should include("Lists")
  end

  it 'includes both lists followed by the user' do
    render
    rendered.should include("List of Awesomeness", "The Second List")
  end
end