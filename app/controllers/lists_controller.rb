class ListsController < ApplicationController
  before_action :require_login, except: [:show, :index ]
  before_action :set_list, only: [:edit, :update, :destroy] 
  before_action :valid_user, only: [:edit, :update, :destroy] #:create

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    user = User.find(session[:user_id])
    if user.lists << @list #does this rollback the list object if it doesn't attach to user? 
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
    if @list.update(list_params) && (params[:list][:item_name]) != ""#this automatically creates a new Item object
      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.json { render json: @list }
      end
    else
      respond_to do |format|
        format.html do 
          flash[:notice] = "There was a problem editing this list."
          render :edit
        end
        format.json { render status: 400}
      end 
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @name = @list.user.username
  end

  def destroy
    @list.destroy
    # render json: { status:'deleted' } #this works too
    respond_to do |format|
      format.html { redirect_to lists_path }
      format.json { render json: @list }
    end
  end

  def remove_item
    @item = Item.find(params[:id])
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id, :item_name)
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
      flash[:notice] = "You are not authorized to edit or delete this list!"
      redirect_to list_path(@list)
    end
  end


end
