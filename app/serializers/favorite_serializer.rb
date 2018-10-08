class FavoriteSerializer < ActiveModel::Serializer
  attributes :timesEaten, :foods

  def timesEaten
    object.times_eaten
  end

  def foods
    object.foods.map do |food|
      {name: food.name, calories: food.calories, mealsWhenEaten: food.meals.pluck(:name).uniq}
    end
  end
end
