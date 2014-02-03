class UsersController < ApplicationController

  def index
  end

  def show
  end

  def  new
  end

  def create
    @user = User.new(params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

end
