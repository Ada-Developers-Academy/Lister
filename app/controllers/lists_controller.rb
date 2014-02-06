class ListsController < ApplicationController
  def new
    @list = List.new 
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
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list.id), notice: "List successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end