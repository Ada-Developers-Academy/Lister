class ListsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
     unless session[:user_id].nil?
      list = List.create(name: params[:name], user_id: session[:user_id])
      redirect_to list_path(list.id)
    else
      redirect_to sign_in_path
    end
  end

end
