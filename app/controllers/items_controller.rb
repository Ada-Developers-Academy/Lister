class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item_id = params[:id]
    @item.destroy
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :list_id, :item_id)
  end
end