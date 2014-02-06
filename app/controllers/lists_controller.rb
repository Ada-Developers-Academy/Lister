class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    unless session[:user_id].nil?
      list = List.create(list_params)
      redirect_to list_path(list.id)
    else
      redirect_to sign_in_path, notice: "Sign in to create a list"
    end
  end

  def show
    @list = List.find_by(id: params[:id])
    @item = Item.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
