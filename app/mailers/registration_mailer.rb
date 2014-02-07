class RegistrationMailer < ActionMailer::Base
  default from: "cue@cuequeue.com"

  def confirm_registration(user_id)
  	@user = User.find(user_id)
  	mail(to: @user.email, subject: "CueQueue Registration Confirmation Email")
  end
end
