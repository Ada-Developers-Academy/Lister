class SessionController < ApplicationController
  def new
    @user = User.new
  end


  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: 'Successfully signed in'
    else
      render :new
      flash[:notice] = "Invalid username or password" 
    end
  end

  def destroy
    session.delete(:user_id)
  end

end
