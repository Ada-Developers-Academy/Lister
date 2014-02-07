class EmailJob
  @queue = :email
  def self.perform(user_id)
    SignInMailer.welcome(user_id).deliver
  end
end