class ItemsController < ApplicationController
before_filter :authorize, only: [:new, :create, :edit, :delete]

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save

      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.json { head :no_content}
      end
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end
end
