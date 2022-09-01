require 'rails_helper'

RSpec.describe 'Describe Recipe', type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'user', email: 'user@gmail.com', password: 123_456)
      visit root_url
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit recipes_path
      
    end

    it 'render List of Recipes title' do
      expect(page).to have_content('Recipes List')
    end

    it 'render a Add Recipe link' do
      expect(page).to have_content('Create a Recipe')
    end

    it 'render a Log out button' do
      expect(page).to have_content('Log out')
    end

    it 'redirecto to new recipe page' do
      click_link 'Create a Recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
    
  end
end
