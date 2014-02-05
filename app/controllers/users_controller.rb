class UsersController < ApplicationController

  def new
    User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "List a list"
      redirect_to "/"
    else
      render :new
    end
  end

  def show
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

