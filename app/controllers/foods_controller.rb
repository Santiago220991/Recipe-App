class FoodsController < ApplicationController
  def index
    @foods = Food.where(user: current_user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path, notice: 'Food added'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    redirect_to foods_path, notice: 'Food deleted' if Food.destroy(@food.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
