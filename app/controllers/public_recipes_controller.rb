class PublicRecipesController < ApplicationController
  def index
    @pub_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end
end
