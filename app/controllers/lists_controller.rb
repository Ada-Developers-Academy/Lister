class ListsController < ApplicationController
  before_action :require_login, except: [:show, :index ]
  before_action :set_list, only: [:edit, :update ] #:destroy
  before_action :valid_user, only: [:edit, :update] #:create

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List has been successfully created!"
      redirect_to list_path(@list)
    else
      flash[:notice] = "There was a problem saving your list."
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      flash[:notice] = "There was a problem editing this list."
      render :edit
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

  def set_list
    @list = List.find(params[:id])
  end

  def require_login
    unless session[:user_id]
      # p "should be nil", session[:user_id]
      flash[:notice] = "You must be signed in!"
      redirect_to lists_path
    end
  end

  def valid_user
    unless session[:user_id] == @list.user.id
      flash[:notice] = "You are not authorized to edit this list!"
      redirect_to list_path(@list)
    end
  end


end
