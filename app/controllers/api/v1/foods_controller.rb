class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    if food
      render json: food
    else
      render status: 404
    end
  end

  def create
    if new_food.save
      render json: new_food
    else
      render status: 400
    end
  end

  def update
    if food.update(food_update_attributes)
      render json: food
    else
      render status: 400
    end
  end

  def destroy
    if food
      food.destroy
      render status: 204
    else
      render status: 404
    end
  end

  private

  def food_params
    if params[:food] && params[:id]
      params.permit(:id, food: [:name, :calories])
    elsif params[:food]
      params.require(:food).permit(:name, :calories)
    else
      params.permit(:id)
    end
  end

  def food_attributes
    {name: food_params[:name], calories: food_params[:calories]}
  end

  def food_update_attributes
    {name: food_params[:food][:name], calories: food_params[:food][:calories]}
  end

  def food
    @food ||= Food.find_by_id(food_params[:id])
  end

  def new_food
    @new_food ||= Food.new(food_attributes)
  end
end
