class ItemsController < ApplicationController
  before_action :check_list, except: :delete
  
  def new
    @item = Item.new
  end

  def create
    if @list.user_id != current_user.id 
      flash[:notice] = "You can only add items to your own list."
      redirect_to current_list_path(@list)
      return
    end

    @item = Item.new(item_params)
    
    if @item.save
      flash[:notice] = "Nice! A new item!"
    end
    
    redirect_to current_list_path(@item.list_id)
  end

  def delete
    @item = Item.find_by(id: params[:id])
    @item.destroy
    redirect_to current_list_path(@item.list_id)
  end

  private

  def item_params
    params.require(:item).permit(:description, :list_id)
  end

  def check_list
    @list = List.find_by(id: params[:item][:list_id])
    
    if @list == nil
      flash[:error] = "Something went wrong!"
      redirect_to root_url
    end
  end
end
