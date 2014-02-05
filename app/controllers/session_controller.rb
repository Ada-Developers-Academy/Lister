class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed in"
      redirect_to user_path(user)
    else
      flash[:notice] = "Invalid username or password"
      render :new
    end
  end
end
