class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def create
    @list = List.find_by(id: params[:item][:list_id])

    if @list.user_id != current_user.id 
      flash[:notice] = "You can only add items to your own list."
      redirect_to current_list_path(@list)
      return
    end
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Nice! A new item!"
      redirect_to current_list_path(@item.list_id)
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:description, :list_id)
  end
end
