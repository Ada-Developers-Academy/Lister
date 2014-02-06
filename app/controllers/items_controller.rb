class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @list = List.find(params[:item][:list_id])
    @item = @list.items.new(name: params[:item][:name])
    if @item.save
      redirect_to list_path(@item.list.id)
    end
  end

end