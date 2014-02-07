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
    @element = Element.find(params[:id])
    list_id = @element.list_id
    @element.destroy
    redirect_to "/lists/#{list_id}"

  end

end

