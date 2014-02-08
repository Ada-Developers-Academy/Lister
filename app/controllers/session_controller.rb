class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back! We missed you!"
    else
      flash.now[:notice] = "What?! You definitely typed something in wrong there."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Was it someting we said?"
  end
end
