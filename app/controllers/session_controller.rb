class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: 'Successfully signed in'
    else
      render :new
      flash.now[:notice] = 'Invalid username or password'
    end
  end
end
