class ItemsController < ApplicationController
  
  def create
    unless session[:user_id].nil?
      @item = Item.create(item_params)
      redirect_to list_path(@item.list_id)
    else
      redirect_to sign_in_path, notice: "Sign in to create an item"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end
