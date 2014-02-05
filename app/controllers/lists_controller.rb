class ListsController < ApplicationController

  def new
    if current_user
      @list = List.new
    else
      flash[:notice] = "Please sign-in first."
      redirect_to root_url
    end
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      flash[:notice] = "You have created a new list."
      redirect_to all_lists_path
    else
      render :new
    end  
  end

  def show
  end

  def index
    @lists = List.all
  end

  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
