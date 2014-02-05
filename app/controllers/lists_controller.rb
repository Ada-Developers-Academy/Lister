class ListsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
     if @current_user
      list = List.create(name: params[:name], user_id: @current_user.id)
      redirect_to list_path(list.id)
    else
      redirect_to sign_in_path
    end
  end

end
