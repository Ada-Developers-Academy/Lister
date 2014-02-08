class EmailJob
  @queue = :email 

  def self.perform(id)
    ListMailer.welcome_email(id).deliver
  end
end