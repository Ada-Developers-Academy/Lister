class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.create(list_params)
    if @list.save
      redirect_to user_path(current_user.id), notice: 'You made a list! Not as good as a handturkey, but I suppose it will do.'
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @list_item = ListItem.new
    respond_to do |format|
      format.html
      format.json{ render json: { @list.title => @list.json } }
    end
  end

  private

  def list_params
    params.require(:list).permit(:title,
                                 :description)
  end
end