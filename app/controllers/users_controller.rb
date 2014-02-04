class UsersController < ApplicationController

  def new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/", notice: "You have successfully created a user!"
    else
      render :new, notice: "Please create a user" 
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
