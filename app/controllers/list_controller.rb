class ListController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to '/list'
  end

  def show
    #list gets set in before action
  end

  def update
  end

  def destroy
  end

  private

  def list_params
    params.permit(:body, :title)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
