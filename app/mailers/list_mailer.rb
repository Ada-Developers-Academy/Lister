class ListMailer < ActionMailer::Base
  default from: "welcome@lister.com"

  def welcome(id)
    user = User.find(id)
    mail(
        to: "#{user.email}",
        subject: "Thanks for joining Lister!"
    )
  end

end