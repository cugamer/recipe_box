class StaticPagesController < ApplicationController
  def homepage
    if logged_in?
      @current_user = current_user
      max_num = [@current_user.recipes.count, 12].min
      @recipes = @current_user.recipes.last(max_num)
    end
  end
end
