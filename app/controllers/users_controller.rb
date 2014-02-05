class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :password_digest)
  end
end