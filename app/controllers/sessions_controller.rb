class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed in"
      redirect_to root_path
    else
      flash[:notice] = "Invalid username or password"
      render new_session_path
    end
  end
end