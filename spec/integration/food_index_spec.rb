require 'rails_helper'

RSpec.describe 'Food', type: :feature do

describe 'index page' do
before(:each) do
User.destroy_all
Food.destroy_all
Recipe.destroy_all
RecipeFood.destroy_all
user=User.create(name:"user", email:"user@gmail.com", password:123456)
visit root_url
fill_in "user_email", with: user.email
fill_in "user_password", with: user.password
click_button 'Log in'
visit foods_path
end
it "should render List of Food title" do
expect(page).to have_content("List of Food")
end
it "should render a Add Food link" do
expect(page).to have_content("Add Food") 
end
it "should render a Log out button" do
expect(page).to have_content("Log out")
end
it "should redirecto to new food page" do
click_link 'Add Food'
expect(page).to have_current_path(new_food_path)
end
end
end
