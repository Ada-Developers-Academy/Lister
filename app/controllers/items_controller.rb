class ItemsController < ApplicationController
  
  def create
    if @current_user
      @item = Item.new(item_params)

      if @item.save

        respond_to do |format|
          format.html { redirect_to list_path(@item.list_id) }
          format.json { head :no_content }
        end
      else
        render :new
      end
      
    else
      redirect_to sign_in_path, notice: "Sign in to create an item"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_path(@item.list_id) }
      format.json { head :no_content }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end
