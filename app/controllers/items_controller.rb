class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
  end

  def delete
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :list_id)
  end
end
