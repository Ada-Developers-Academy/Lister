class UserMailer < ActionMailer::Base
  default from: "Info@Lister.com"

  def join_us(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Hi #{@user.username}! Thank you for joining Lister")
  end
end
