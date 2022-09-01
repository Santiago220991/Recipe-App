require 'rails_helper'

RSpec.describe Recipe, type: :system do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Luis', id: 1, email: 'test@test', password: '123456', role: 'admin')
      @recipe = Recipe.create(name: 'Test Recipe', preparation_time: '10', cooking_time: '10',
                              description: 'Test Description', user_id: @user.id)
    end

    it 'Is valid with valid attributes' do
      expect(@recipe).to be_valid
    end

    it 'Is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'Is not valid without a preparation_time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'Is not valid without a cooking_time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'Is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'Is not valid without a user_id' do
      @recipe.user_id = nil
      expect(@recipe).to_not be_valid
    end
  end
end
