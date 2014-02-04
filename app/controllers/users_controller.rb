class UsersController < ApplicationController

  def new
    User.new
  end

  def create
    user = User.new(
      username: params[:user][:username], 
      email: params[:user][:email], 
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation])
    if user.save
      flash[:notice] = "List a list"
      redirect_to "/"
    else
      render :new
    end
  end

  def show
  end
end
