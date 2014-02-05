class ListsController < ApplicationController
  def new  
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id), notice: "List successfully created"
    end
  end

  def show
    @list = List.find_by(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end