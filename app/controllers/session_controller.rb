class SessionController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully signed in'
    else
      flash.now[:notice] = "Invalid username or password"
      render :new
    end
  end  
end
