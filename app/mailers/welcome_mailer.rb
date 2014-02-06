class WelcomeMailer < ActionMailer::Base
  default from: "davida@example.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(
      to: @user.email,
      subject: 'Welcome to My Awesome Site of Lists'
      )
  end
end
