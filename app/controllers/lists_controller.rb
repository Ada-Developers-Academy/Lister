class ListsController < ApplicationController

  def new
    
  end

  def create
    @list = List.new
    @list.save
    redirect_to list_path(@list.id)
  end

end