class ListsController < ApplicationController

  def new
    @list = List.new
    @user = current_user
  end

  def create
    # params = {id: 1, list: {list_name: "To do", description: "Something"}}
    # params[:list]
    # @list = List.new(list_name: params[:list_name])
    @list = List.new(params.require(:list).permit(:list_name, :user_id))
    # @list = List.new(params[:list_name])
    if @list.save
      redirect_to list_path(@list.id)
    else
      @list = List.new
      render :new
    end
  end



  def show
  end

end