class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new

  end

  def create
    @user = User.new(user_params)

    if @user.save!
      flash[:notice] = "Welcome #{@user.username}!"
      redirect_to users_path
    else
      render 'new', notice: 'User not saved'
    end
  end

  def show
    @users = User.all
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :pasword, :password_confirmation)
  end

end
