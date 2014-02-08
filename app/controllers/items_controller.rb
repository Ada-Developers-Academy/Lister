class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to list_path(@item.list_id) }
        format.json {render :json => @item}
      end
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.json {render :json => @item}
    end
  end

  def item_params
    params.require(:item).permit(:content, :list_id)
  end
end
