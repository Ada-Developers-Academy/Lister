class ListMailer < ActionMailer::Base
  default from: "info@thelist.com"

  def welcome_email(user_id)
    @user = User.find(user_id)
    # when it works change back to @user.email
    mail(to: @user.email, subject: "Welcome to The List")
  end
end
