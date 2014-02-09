class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    unless session[:user_id].nil?
      @list = List.new(params.require(:list).permit(:title, :user_id))
      @list.user_id = session[:user_id]
      if @list.save
        redirect_to lists_path(@list.id), notice: "Thanks for listing your list!" 
      else
        render :new, notice: "Something went wrong :("
      end
    else
      redirect_to sign_in_path, notice: "You need to sign in to list a list!"
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
    @element = Element.new
  end

  def destroy
  end

end