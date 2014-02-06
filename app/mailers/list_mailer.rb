class ListMailer < ActionMailer::Base
  default from: "lister@example.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: "audreycarlsen@gmail.com", subject: "Welcome to Lister!")
  end
end
