class ItemsController < ApplicationController
  
  def create
    if @current_user
      @item = Item.create(item_params)
      redirect_to list_path(@item.list_id)
    else
      redirect_to sign_in_path, notice: "Sign in to create an item"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    list_id = @item.list_id
    @item.destroy
    redirect_to list_path(list_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end
