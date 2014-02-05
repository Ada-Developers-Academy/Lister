class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      redirect_to "/", notice: "You have successfully created a user!"
    else
      render :new, notice: "Please create a user" 
    end
  end

end
