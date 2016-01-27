class RecipesController < ApplicationController
  before_action :require_login
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
    @recipe.directions.build
    @recipe.ingredients.build
  end
  
  def create
    @recipe = User.find(current_user).recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @directions = @recipe.directions
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "The recipe was updated successfully."
      redirect_to @recipe
    else
      render 'edit'
    end
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    title = recipe.title
    if recipe.user_id == current_user.id
      recipe.destroy
    end
    flash[:success] = "The recipe \"#{title}\" has been removed successfully."
    redirect_to root_path
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:description, :title, :photo, 
                                      directions_attributes:[:id, :direction, :_destroy],
                                      ingredients_attributes:[:id, :ingredient, :_destroy])
    end
    
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this action"
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(Recipe.find(params[:id]).user_id)
      redirect_to(root_url) unless @user == current_user
    end
end
