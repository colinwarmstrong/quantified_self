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

  def meal_names(meals)
    meals.map do |meal|
      meal.name
    end.uniq
  end
end
