class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Resque.enqueue(EmailJob, @user.email)
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def show
    if params[:id].nil?
      @user = @current_user
    else
      @user = User.find(params[:id])
    end
    respond_to do |format|
      format.html
      format.json{ render json: { @user.name => @user.json } }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :password_digest)
  end
end