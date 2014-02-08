class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Resque.enqueue(EmailJob, @user.id)
      session[:user_id] = @user.id
      flash[:notice] = "List a list"
      redirect_to "/profile"
    else
      render :new
    end
  end

  def show
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

