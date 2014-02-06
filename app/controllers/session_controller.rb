class SessionController < ApplicationController
  
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @current_user = @user
      redirect_to '/', notice: 'Successfully signed in'
    else
      flash[:notice] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "You are now logged out. Thanks for listing!"
  end

  
end
