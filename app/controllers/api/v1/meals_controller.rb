class Api::V1::MealsController < ApplicationController
  def index
    meals = Meal.all
    render json: meals
  end

  def show
    meal = Meal.find_by_id(params[:meal_id])
    if meal
      render json: meal
    else
      render status: 404
    end
  end
end
