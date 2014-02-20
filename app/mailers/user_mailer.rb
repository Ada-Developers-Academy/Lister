class UserMailer < ActionMailer::Base
  default from: "list_it@example.com"

  def welcome_email(user_id)
    @user = User.find(user_id)
    mail( to: @user.email, 
          subject: "Thanks for signing up!")
  end

end
