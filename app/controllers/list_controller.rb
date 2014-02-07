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
    #redirect_to '/list'
  end

  def show
    #list gets set in before action
  end

  def update
    if @list.update(list_params) #this automatically creates a new Item object
      p @list.class
      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.json { render json: @list }
      end
    else
      respond_to do |format|
        format.html do
          flash[:notice] = "Couldn't edit list"
          render :edit
        end
        format.json { render status: 400 }
      end
    end
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
