class ListItemsController < ApplicationController
  def new
  end

  def create
    @list_item = ListItem.new(item_params)
    if @list_item.save
      respond_to do |format|
        format.html { redirect_to list_path(params[:list_item][:list_id]) }
        format.json { head :no_content}
      end
    end
  end

  def destroy
    @item = ListItem.find(params[:id])
    @list = List.find(@item.list)
    @item.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to list_path(@list.id)}
    end
  end

  private

  def item_params
    params.require(:list_item).permit(:description, :list_id)
  end
end
