class FavoritesPresenter
  def favorites
    most_eaten_foods.map do |count, foods|
      Favorite.new(count, foods)
    end
  end

  private

  def most_eaten_foods
    sorted_foods.shift(3)
  end

  def sorted_foods
    grouped_foods.sort_by { |count, food| -count }
  end

  def grouped_foods
    times_eaten_per_food.group_by { |food| food.times_eaten }
  end

  def times_eaten_per_food
    x = Food.select('foods.*, COUNT(meal_foods.food_id) AS times_eaten')
      .joins(:meals)
      .eager_load(:meals)
      .group('meals.id, foods.id, meal_foods.food_id')
      .having('COUNT(meal_foods.food_id) > 1')
      .order('times_eaten DESC')
      binding.pry
  end
end
