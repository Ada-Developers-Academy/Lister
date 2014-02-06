class WelcomeController < ApplicationController
  def index
    @user_id = session[:user_id]
  end
end
