class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to "list/show", notice: "Successfully created new list"
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
    item.destroy
    redirect_to "list/show", notice: "Your item has been deleted"
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :list_id) if params[:item]
  end
end
