class ListController < ApplicationController
  #before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new
    redirect_to @list
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def list_params
    params.require(:list).permit(:title, :body)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
