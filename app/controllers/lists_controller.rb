class ListsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :delete, :show]
  before_action :set_list, except: [:new, :create, :index, :users_lists]

  def index
    @lists = List.all
  end

  def show
  end

  def users_lists
    @current_users_lists = List.where(user_id: @current_user.id).reverse
  end

  def new
    @list = List.new
  end

  def create
     if @current_user
      list = List.create(list_params)
      redirect_to list_path(list.id)
    else
      redirect_to sign_in_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
