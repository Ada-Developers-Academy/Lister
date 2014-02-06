class ListsController < ApplicationController

  def new
    if @current_user == nil
      redirect_to sign_in_path
      flash[:notice] = "Log in before making lists!"
    else
      render :new
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to '/'
      flash[:notice] = "You made a list! That's almost as good as doing a thing!"
    else
      render :new
    end
  end

  def show
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to user_path(@current_user.id)
  end

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
