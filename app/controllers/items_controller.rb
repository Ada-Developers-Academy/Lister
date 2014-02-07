class ItemsController < ApplicationController
  def new
    @item = Item.new(list_id: params[:list_id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to list_path(@item.list), notice: "Successfully created new item"
      else
        render :new
    end
  end

  def show
  end

  def index
  end

  def destroy
    item = Item.find(params[:id])
    list = item.list_id
    item.destroy
    redirect_to list_path(list), notice: "Your item has been deleted"
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :list_id) if params[:item]
  end
end
