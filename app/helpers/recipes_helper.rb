module RecipesHelper
  def get_image_or_n_a(recipe)
    if recipe.photo.exists?
      recipe.photo.url(:medium)
    else
      "no_image_ld.jpg"
    end
  end
end
