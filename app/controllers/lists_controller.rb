class ListsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :delete]
  def new
  end

  def index
  end

  def create
    @list = List.new(list_params)
    @list[:user_id] = session[:user_id]
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
