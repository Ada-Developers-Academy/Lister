class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :add_item]

  def new
    @list = List.new  
  end

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path
    else 
      flash[:notice] = 'list must have a name'
      render 'new'
    end
  end

  def show

  end

  def add_item(name)
    @list.add_item(name)
  end 


  private
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end