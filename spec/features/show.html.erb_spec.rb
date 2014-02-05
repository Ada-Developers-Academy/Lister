describe 'On the User show page', type: :feature do 
  before(:each) do
    # none of this works. Capybara, how do you work?!
    User.create!(email: 'a@b.c')
    @current_user = current_user
    current_user.lists.create(title: "List of Awesomeness")
    current_user.lists.create(title: "The Second List")
  end
  
  describe 'clicking on a list' do

  end
end