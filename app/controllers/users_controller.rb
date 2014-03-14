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
      Resque.enqueue(EmailJob, @user.id)
      flash[:notice] = "User has been successfully created!"
      redirect_to users_path
    else
      render :new
    end
  end 

  def show #should be accessible by other users?
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

    # List name
    # Number of items
    # Author name
    # ID
    # Created_at
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
