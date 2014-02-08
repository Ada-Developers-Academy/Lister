class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    if @current_user
      @list = List.create(list_params)
      redirect_to list_path(@list.id)
    else
      redirect_to sign_in_path, notice: "Sign in to create a list"
    end
  end

  def show
    @list = List.find_by(id: params[:id])
    @item = Item.new

    list_hash = {
      id: @list.id,
      name: @list.name,
      author: @list.user.username,
      created_at: @list.created_at,
      items: @list.items.map {|item| item.name}
    }

    respond_to do |format|
      format.html { render :show }
      format.json { render json: list_hash }
    end
  end

  def my_lists
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
