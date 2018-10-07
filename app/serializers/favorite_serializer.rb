class FavoriteSerializer < ActiveModel::Serializer
  attributes :timesEaten, :foods

  def timesEaten
    object.count
  end

  def foods
    object.foods.map do |food|
      {name: food.name, calories: food.calories, mealsWhenEaten: meal_names(food.meals)}
    end
  end

  private

  def meal_names(meals)
    meals.map { |meal| meal.name }.uniq
  end
end
