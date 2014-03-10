class SessionsController < ApplicationController

  def new
  end

  def create
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to root_path, notice: 'Successfully signed in'
     else
       flash.now[:notice] = "Invalid username or password"
       redirect_to root_path
     end
   end

   def destroy
      @current_user = nil
      reset_session
       redirect_to root_path, :notice => "You have been successfully signed out."
   end
end
