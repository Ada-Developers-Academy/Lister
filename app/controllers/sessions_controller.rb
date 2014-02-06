class SessionsController < ApplicationController

  def new
    @user= User.new
  end

  def create
    user = User.find_by(username: params["username"])  
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed in"
      redirect_to "/" 
    else
      flash[:notice] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.destroy
    session[:user_id] = nil
  end
end
