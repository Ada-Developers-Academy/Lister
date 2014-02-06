class UsersController < ApplicationController

  def index
    @users = User.all
    @lists = List.all
    @users_lists = List.where(user_id: @current_user.id) if @current_user
  end

  def show
    @users = User.all
  end

  def  new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      Resque.enqueue(EmailJob, @user.id)
        redirect_to root_path, notice: "Successfully created new user"
      else
        redirect_to root_path
      end
  end

  def edit
  end

  def update
  end

  private
  def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
