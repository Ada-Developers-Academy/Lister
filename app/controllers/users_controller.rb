class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      Resque.enqueue(EmailJob, @user.id)
      
      redirect_to root_path, notice: "You've been created! Check your email for confirmation that you exist."
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists

    list_hash = @lists.map do |list|
      { name: list.name,
        items: list.items.count,
        author: list.user.username,
        id: list.id,
        created_at: list.created_at
      }
    end
    
    respond_to do |format|
      format.html { render :show}
      format.json { render json: list_hash}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
