class UsersController < ApplicationController
  
  def show
    
  end
  
  def new
    
  end
  
  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      redirect_to root_path, notice: "Successfully created a user"
    else
      render :new
    end
  end
end
