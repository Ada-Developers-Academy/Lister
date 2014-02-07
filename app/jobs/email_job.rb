class EmailJob
  @queue = :email
  def self.perform(user_id)
    UserMailer.join_us(user_id).deliver
  end
end