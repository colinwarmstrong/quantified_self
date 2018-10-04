class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    if meal
      render json: meal
    else
      render status: 404
    end
  end

  def create
    if successful_create?
      render json: {message: "Successfully added #{food.name} to #{meal.name}"}, status: 201
    else
      render status: 404
    end
  end

  def destroy
    if successful_destroy?
      render json: {message: "Successfully removed #{food.name} from #{meal.name}"}
    else
      render status: 404
    end
  end

  private

  def meal_params
    params.permit(:id, :meal_id)
  end

  def meal
    @meal ||= Meal.find_by_id(meal_params[:meal_id])
  end

  def food
    @food ||= Food.find_by_id(meal_params[:id])
  end

  def successful_create?
    !meal.nil? && !food.nil? && meal.meal_foods.create(meal_id: meal.id, food_id: food.id)
  end

  def successful_destroy?
    !meal.nil? && !food.nil? && meal.meal_foods.find_by_food_id(food.id).destroy
  end
end
