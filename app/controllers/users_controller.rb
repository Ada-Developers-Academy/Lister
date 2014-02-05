class UsersController < ApplicationController
  include ApplicationHelper
  before_action :current_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def show
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
