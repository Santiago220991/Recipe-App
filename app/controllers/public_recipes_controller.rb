class PublicRecipesController < ApplicationController
  def index
    @pub_recipes = Recipe.includes(:user, :recipe_foods, :foods).order(created_at: :desc)
  end
end
