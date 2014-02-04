class UsersController < ApplicationController

  def index
  end

  def show
  end

  def  new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Resque.enqueue(EmailJob, @user.id)
        redirect_to root_path, notice: "Successfully created new user"
      else
        render :new
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
