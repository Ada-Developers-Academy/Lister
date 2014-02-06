class ItemsController < ApplicationController
before_filter :authorize, only: [:new, :create, :edit, :delete]

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end
end
