class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      @list.update(user_id: current_user.id)
      redirect_to user_path(current_user.id), notice: 'You made a list! Not as good as a handturkey, but I suppose it will do.'
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:title,
                                 :description)
  end
end