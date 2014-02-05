class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
    if @list.user.id == session[:user_id]
    else
      flash[:notice] = "You are not authorized to edit this list!"
      redirect_to list_path(@list)
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.user.id == session[:user_id]
      if @list.update(list_params)
        redirect_to list_path(@list)
      else
        p @list.errors.full_messages
        flash[:notice] = "There was a problem editing this list."
        render :edit
      end
    else
      flash[:notice] = "You are not authorized to update this list!"
      redirect_to list_path(@list)
    end
  end

  def create
    if session[:user_id]
      @list = List.new(list_params)
      if @list.save
        flash[:notice] = "List has been successfully created!"
        redirect_to list_path(@list)
      else
        flash[:notice] = "There was a problem saving your list."
        render :new
      end
    else
      flash[:notice] = "You must be signed in to create a list!"
      redirect_to lists_path
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
