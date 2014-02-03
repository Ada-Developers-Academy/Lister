class UsersController < ApplicationController

  def new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to "/", notice: "You have successfully created a user!"
    else
      redirect_to sign_in_path, notice: "Something went wrong. :(" 
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
