class RecipiesController < ApplicationController
  def new
    @recipie = Recipie.new
  end
  
  def create
    @recipie = Recipie.new(recipie_params)
    if @recipie.save
      
    else
      render 'new'
    end
  end
  
  private
    def recipie_params
      params.require(:recipie).permit(:description, :title)
    end
end
