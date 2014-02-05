class ItemsController < ApplicationController
  
  def create
    unless session[:user_id].nil?
      item = Item.create(name: params[:name], list_id: params[:list_id])
      redirect_to :back
    else
      redirect_to sign_in_path, notice: "Sign in to create an item"
    end
  end

end
