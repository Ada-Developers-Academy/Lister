class UserMailer < ActionMailer::Base
  default from: "elizabeth.uselton@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @user = user
    mail to: user.email, subject: "Lists!"
  end
end
