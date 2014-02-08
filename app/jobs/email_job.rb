class EmailJob
  @queue = :email
  def self.perform(foo)
    ListMailer.welcome_email(foo).deliver
  end
end