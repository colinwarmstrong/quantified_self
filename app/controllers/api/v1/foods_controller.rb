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

  private

  def food_params
    params.permit(:id)
  end
end
