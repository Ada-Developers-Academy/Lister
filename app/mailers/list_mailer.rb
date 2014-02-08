class ListMailer < ActionMailer::Base
  default from: "audreycarlsen@gmail..com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: "#{@user.email}", subject: "Welcome to Lister!")
  end
end
