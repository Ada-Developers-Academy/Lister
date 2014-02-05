class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
  end

  def create
    unless session[:user_id].nil?
      list = List.create(name: params[:name], user_id: session[:user_id])
      redirect_to list_path(list.id)
    else
      redirect_to sign_in_path, notice: "Sign in to create a list"
    end
  end

  def show
    @list = List.find_by(id: params[:id])
  end

end
