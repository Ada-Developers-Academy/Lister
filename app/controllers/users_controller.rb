class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
      flash[:notice] = "You made a User"
    else
      render action: 'new'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
