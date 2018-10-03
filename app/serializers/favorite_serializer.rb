class FavoriteSerializer < ActiveModel::Serializer
  attributes :timesEaten, :foods

  def timesEaten
    object.count
  end

  def foods
    object.foods.map do |food|
      {name: food.name, calories: food.calories, mealsWhenEaten: food.meals.distinct.pluck(:name)}
    end
  end
end
