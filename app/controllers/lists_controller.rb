class ListsController < ApplicationController

  def new  
  end

  def post
    @list = List.create(list_params)
  end




  private
  def set_list

  end

  def list_params
    params.require(:list).permit(:name)
  end
end