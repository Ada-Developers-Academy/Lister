class EmailJob
  @queue = :email
  def self.perform(user_id)
    ListMailer.welcome(user_id).deliver
  end
end