class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    if session[:user_id]
      @list = List.new(list_params)
      if @list.save
        flash[:notice] = "List has been successfully created!"
        # p User.find(session[:user_id]).lists
        # p @list.user
        redirect_to user_path(session[:user_id])
      else
        flash[:notice] = "There was a problem saving your list."
        render :new
      end
    else
      flash[:notice] = "You must be signed in to create a list!"
      redirect_to lists_path
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

private
  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
