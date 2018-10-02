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
    food = Food.new(name: food_params[:name], calories: food_params[:calories])
    if food.save
      render json: food
    else
      render status: 400
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
end
