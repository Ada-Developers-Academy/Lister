class ListMailer < ActionMailer::Base
  default from: "welcome@lister.com"

  #This is technically an instance method, but rails is calling it on the class
  def welcome(user_id)
    user = User.find(user_id)
    mail(
      to: "#{user.email}",
      subject: "Welcome to Lister!"
      )
  end

end
