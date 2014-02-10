class WelcomeController < ApplicationController
  def index
    @lists = List.all
    @users = User.all
  end
end
