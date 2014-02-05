class EmailJob
  @queue = :email
  def self.perform(list_id)
    ListMailer.join_us(list_id).deliver
  end
end