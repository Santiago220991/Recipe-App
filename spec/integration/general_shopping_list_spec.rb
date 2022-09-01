require 'rails_helper'

RSpec.describe 'General Shopping List', type: :feature do
  describe 'index page' do
    before(:each) do
      User.destroy_all
      Food.destroy_all
      Recipe.destroy_all
      RecipeFood.destroy_all
      user = User.create(name: 'user', email: 'user@gmail.com', password: 123_456)
      food = Food.create(name: 'meat', measurement_unit: 'lib', price: 1, quantity: 3, user:)
      recipe = Recipe.create(name: 'bulgogi', preparation_time: 2, cooking_time: 1, description: 'good', public: true,
                             user:)
      RecipeFood.create(quantity: 5, recipe:, food:)
      visit root_url
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      visit general_shopping_list_index_path(recipe_id: recipe.id)
    end
    it 'should render Shopping List title' do
      expect(page).to have_content('Shopping List')
    end

    it 'Ammount of food items to buy should be 1' do
      expect(page).to have_content('Amount of food items to buy: 1')
    end

    it 'Total value of food needed: ' do
      expect(page).to have_content('Total value of food needed: 2')
    end

    it 'Should rener a food called meat: ' do
      expect(page).to have_content('meat')
    end
  end
end