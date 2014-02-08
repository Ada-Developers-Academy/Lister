class ListMailer < ActionMailer::Base
  default from: "llamalister@gmail.com"

  def welcome_email(foo)
    mail(to: foo, subject: "Welcome!")
  end
end
