class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      flash[:notice] = "You have created a new list."
      redirect_to current_list_path(@list.id)
    else
      render :new
    end  
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new#@list.items
  end

  def index
    @lists = List.all
  end

  def delete
    @list = List.find(params[:id])
    @list.destroy
  end

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
