class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:title, :user_id))
    if @list.save
      redirect_to '/', notice: "Thanks for listing your list!"
    else
      render :new, notice: "Something went wrong :("
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  def destroy
  end

end