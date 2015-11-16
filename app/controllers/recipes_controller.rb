class RecipesController < ApplicationController
  before_action :require_login
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:description, :title, :photo)
    end
    
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this action"
        redirect_to login_url
      end
    end
end
