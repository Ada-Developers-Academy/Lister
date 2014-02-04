class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    if session[:user_id]
      @list = List.new(list_params)
      if @list.save
        p @list
        redirect_to user_path(session[:user_id])
      else

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
