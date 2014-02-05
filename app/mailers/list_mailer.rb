class ListMailer < ActionMailer::Base
  default from: "from@example.com"

  def join_us(list_id)
    # @list = List.find(list_id)
    mail(to: "shanghaiellen@gmail.com", subject: "Your list looks lonely!")
  end
end