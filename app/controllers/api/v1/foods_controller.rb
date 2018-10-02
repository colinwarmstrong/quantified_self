class Api::V1::FoodsController < ApplicationController
  def index
    foods = Food.all
    render json: foods
  end

  def show
    food = Food.find_by_id(food_params[:id])
    if food
      render json: food
    else
      render status: 404
    end
  end

  def create
    food = Food.new(food_attributes)
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def update
    food = Food.find_by_id(params[:id])
    if food.update(food_attributes)
      render json: food
    else
      render status: 400
    end
  end

  def destroy
    food = Food.find_by_id(food_params[:id])
    if food
      food.destroy
      render status: 204
    else
      render status: 404
    end
  end

  private

  def food_params
    if params[:food]
      params.require(:food).permit(:name, :calories)
    else
      params.permit(:id)
    end
  end

  def food_attributes
    {name: food_params[:name], calories: food_params[:calories]}
  end
end
