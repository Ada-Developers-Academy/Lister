class EmailJob
  @queue = :email
  def self.perform
    ListMailer.welcome.deliver
  end
end