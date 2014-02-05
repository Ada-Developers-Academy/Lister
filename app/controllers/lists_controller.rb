class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:title))
    if @list.save
      redirect_to '/', notice: "Thanks for listing your list!"
    else
      render :new, notice: "Something went wrong :("
    end
  end

  def index
  end

  def show
  end

  def destroy
  end

end