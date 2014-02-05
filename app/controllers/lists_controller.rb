class ListsController < ApplicationController
  def new
  end

  def create
    if @current_user
      @list = @current_user.lists.create(list_params)
      if @list.save 
        redirect_to root_url, notice: "Your list was created!"
      else
        render "new"
      end
    else
      redirect_to new_user_path, notice: "You must be logged in to do that"
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end