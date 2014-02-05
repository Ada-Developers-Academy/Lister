class ListsController < ApplicationController

  def new  
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


  private
  def list_params
    params.require(:list).permit(:name)
  end
end