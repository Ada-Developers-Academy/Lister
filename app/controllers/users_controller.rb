class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to "/"
      flash[:notice] = "You made a User"
    else
      render action: 'new'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def show
    @user = User.find(params[:id])
  end
end
