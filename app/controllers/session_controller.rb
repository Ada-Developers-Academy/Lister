class SessionController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      sign_in
      redirect_to user_path(@user.id), notice: "Successfully signed in"
    else
      @user = User.new
      flash[:notice] = "Invalid username or password"
      render "new"
    end
  end

  def sign_in
    session[:user_id] = @user.id
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been successfully signed out."
  end
end
