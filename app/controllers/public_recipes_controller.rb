class PublicRecipesController < ApplicationController
  def index
    @pub_recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
