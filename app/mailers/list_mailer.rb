class ListMailer < ActionMailer::Base
  default from: "feedhunter2014@gmail.com"

  def welcome_email(foo)
    mail(to: foo, subject: "Welcome!")
  end
end
