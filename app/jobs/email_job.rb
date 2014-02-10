class EmailJob
  @queue = :email
  def self.perform(id)
    WelcomeMailer.welcome(id).deliver
  end
end