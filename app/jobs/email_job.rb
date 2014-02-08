class EmailJob
    @queue = :email  

    def self.perform(user_id)    
      UserMailer.welcome_email(user_id).deliver 
    end

end