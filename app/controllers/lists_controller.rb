class ListsController < ApplicationController
  def new  
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id), notice: "List successfully created"
    else
      redirect_to new_list_path, notice: "Title can't be blank!"
    end
  end

  def show
    @list = List.find_by(params[:id])
  end

  def index
    @lists = List.all
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end