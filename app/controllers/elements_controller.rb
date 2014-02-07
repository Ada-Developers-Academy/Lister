class ElementsController < ApplicationController

  def new
  end

  def create
    @element = Element.new(params.require(:element).permit(:body, :list_id))
    if @element.save
      redirect_to "/lists/#{@element.list_id}"
    end
  end

  def destroy
  end

end
