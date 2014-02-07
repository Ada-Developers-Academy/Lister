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
    if List.find(params[:id]).user_id == @current_user.id
      List.find(params[:id]).destroy
      redirect_to user_path(@current_user.id)
    else
      redirect_to list_path(params[:id])
      flash[:notice] = "You can't delete this list because you are not its owner."
    end
  end

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
