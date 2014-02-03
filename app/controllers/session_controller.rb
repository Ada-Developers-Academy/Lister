class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.create(username: params[:username], password: params[:password])
     if @user.save
    session[:user_id] = user.id
      redirect_to "/", flash[:notice] = "Successfully signed in"
    end
  end
end
