class ElementsController < ApplicationController

  def new
  end

  def create
    @element = Element.new(params.require(:element).permit(:body, :list_id))
    if @element.save
      respond_to do |f|
        f.html { redirect_to "/lists/#{@element.list_id}" }
        f.json {render :json => @element}
      end
    end
  end

  def destroy
    @element = Element.find(params[:id])
    list_id = @element.list_id
    @element.destroy

    respond_to do |f|
      f.html {redirect_to "/lists/#{list_id}"}
      f.json {render :json => @element}
    end

  end

end

