class GeneralShoppingListController < ApplicationController
    def index 
        @recipe_foods=RecipeFood.where(recipe_id: params[:recipe_id])
        @food_items=@recipe_foods.length
        @total=0
        @recipe_foods.each do |food|
        @total+=food.quantity*Food.find(food.food_id).price
        end
    end
end