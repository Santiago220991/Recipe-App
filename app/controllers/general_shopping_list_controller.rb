class GeneralShoppingListController < ApplicationController
  def index
    @recipe_foods = RecipeFood.where(recipe_id: params[:recipe_id])
    @recipe_foods.each do |food|
      if (Food.find(food.food_id).quantity-food.quantity < 1)
        food.quantity=(Food.find(food.food_id).quantity-food.quantity)*(-1)
      else
        food.quantity=0
      end
    end
    @recipe_foods=@recipe_foods.filter {|element| element.quantity!=0}
    @food_items = @recipe_foods.length
    @total = 0   
    @recipe_foods.each do |food|
      @total += food.quantity * Food.find(food.food_id).price
    end
  end
end
