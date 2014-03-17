class RegistrationMailer < ActionMailer::Base
  default from: "cue@example.com"

  def confirm_registration(user_id)
  	@user = User.find(user_id)
  	mail(to: @user.email, subject: "CueQueue Registration Confirmation Email").deliver
  end
end
