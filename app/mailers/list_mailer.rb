class ListMailer < ActionMailer::Base
  default from: "info@thelist.list"

  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(to: "stalkmore00@gmail.com", subject: "Welcome to The List")
  end
end
