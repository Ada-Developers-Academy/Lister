class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been successfully created!"
      ListMailer.welcome(@user.id).deliver
      redirect_to users_path
    else
      render :new
    end
  end 

  def show #should be accessible by other users?
    @user = User.find(params[:id])
    @lists = @user.lists
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
