class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully signed in"
      redirect_to root_path
    else
      flash[:notice] = "Invalid username or password"
      @user = User.new
      render new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to '/', :notice => "Logged out!"
  end
end