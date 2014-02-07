class ItemsController < ApplicationController

  def new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path, notice: "Can't be blank" 
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end
