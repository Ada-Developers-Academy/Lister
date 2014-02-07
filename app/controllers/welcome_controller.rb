class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to user_path
    else
      @lists = List.all
    end
  end

end