class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
     @list = List.new(list_params)
    if @list.save
        redirect_to root_path, notice: "Successfully created new list"
      else
        render :new
    end
  end

  def delete
  end

  def index
    List.all
  end

  def show
  end

  def update
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :user_id)
  end
end
