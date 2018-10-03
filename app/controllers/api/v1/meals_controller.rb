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

  def create
    meal = Meal.find_by_id(params[:meal_id])
    food = Food.find_by_id(params[:id])
    if !meal.nil? && !food.nil? && meal.meal_foods.create(meal_id: meal.id, food_id: food.id)
      render json: {message: "Successfully added #{food.name} to #{meal.name}"}, status: 201
    else
      render status: 404
    end
  end

  def destroy
    meal = Meal.find_by_id(params[:meal_id])
    food = Food.find_by_id(params[:id])
    if !meal.nil? && !food.nil?
      meal.meal_foods.find_by_food_id(food.id).destroy
      render json: {message: "Successfully removed #{food.name} from #{meal.name}"}
    else
      render status: 404
    end
  end
end
