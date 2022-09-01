require 'rails_helper'

RSpec.describe RecipeFood, type: :system do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Luis', id:1, email:'test@test', password:'123456', role:'admin')
      @recipe = Recipe.create(name: "Test Recipe", preparation_time: "10", cooking_time: "10",description: "Test Description", user_id: @user.id)
      @food = Food.create(name: "Test Food", measurement_unit: "g", price: 1, user_id: @user.id, quantity: 1)
      @recipe_food = RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)
    end
    
    it 'Is valid with valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'Is not valid without a recipe_id' do
      @recipe_food.recipe_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'Is not valid without a food_id' do
      @recipe_food.food_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'Is not valid without a quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end
    
  end
end