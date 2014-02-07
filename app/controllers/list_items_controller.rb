class ListItemsController < ApplicationController
  def new
    @list_item = ListItem.new
  end

  def create
    @list_item = ListItem.new(item_params)
    if @list_item.save
      respond_to do |format|
        format.js
        format.html { redirect_to list_path(@list_item.list_id) }
      end
    end
  end

  def destroy
    @item = ListItem.find(params[:id])
    @list = @item.list
    # @item_id = params[:id]
    @item.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to list_path(@list.id) }
    end
  end

  private

  def item_params
    params.require(:list_item).permit(:description, :list_id)
  end
end
