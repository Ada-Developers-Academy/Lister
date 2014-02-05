# After talking with Bookis, I decided to switch to testing with Capybara. I chose to leave
# this code, however, as it was still a valid educational experience.

require 'spec_helper'

describe 'users/show' do 
  let(:current_user) { create(:user)}
  before(:each) do
    @current_user = current_user
  end
  # just wrote this because this is the first list I have ever written for a view
  it 'actually tests the view' do
    render
    rendered.should include("Lists")
  end

  it 'includes both lists followed by the user' do
    current_user.lists.create(title: "List of Awesomeness")
    current_user.lists.create(title: "The Second List")
    render
    rendered.should include("List of Awesomeness", "The Second List")
  end
end