require 'rails_helper'

RSpec.describe 'food/index', type: :system do
  describe 'index page' do
    before do 
       @user = User.create(name: 'Luis', id:1, email:'test@test', password:'123456', role:'admin')
      @food = Food.create(name: "Test Food", measurement_unit: "g", price: 1, user_id: @user.id, quantity: 1)
    end

    it 'displays all foods' do
      visit foods_path
      expect(page).to redirect_to new_user_session_path
    end
  end
end