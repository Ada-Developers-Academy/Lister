class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
      flash[:notice] = "Successfully signed in"
    elsif user && user.authenticate(params[:password]) == false
      flash[:notice] = "Invalid username or password"
      render 'new'
    elsif  user == nil
      flash[:notice] = "Invalid username or password"
      render 'new'
    end
  end

end