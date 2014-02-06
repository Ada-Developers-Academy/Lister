class ListMailer < ActionMailer::Base
  default from: "lister@example.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: "#{@user.email}", subject: "Welcome to Lister!")
  end
end
