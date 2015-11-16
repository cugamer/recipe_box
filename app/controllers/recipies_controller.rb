class RecipiesController < ApplicationController
  def show
    @recipie = Recipie.find(params[:id])
  end
  
  def new
    @recipie = Recipie.new
  end
  
  def create
    @recipie = Recipie.new(recipie_params)
    if @recipie.save
      redirect_to @recipie
    else
      render 'new'
    end
  end
  
  private
    def recipie_params
      params.require(:recipie).permit(:description, :title)
    end
end
