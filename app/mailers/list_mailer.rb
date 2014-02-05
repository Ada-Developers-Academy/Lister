class ListMailer < ActionMailer::Base
  default from: "welcome@lister.com"

  #This is technically an instance method, but rails is calling it on the class
  def welcome
    mail(
      to: "hhhsu1@gmail.com",
      subject: "Welcome to Lister!"
      )
  end

end
