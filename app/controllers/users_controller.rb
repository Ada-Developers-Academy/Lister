class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Resque.enqueue(EmailJob, @user.id)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: 'Well done, you.'
    else
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
      @lists = @user.lists
    else
      redirect_to :root, notice: 'Tsk tsk, log in to look at your user page'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end


end
