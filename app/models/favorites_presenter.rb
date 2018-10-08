class FavoritesPresenter
  def favorites
    most_eaten_foods.map do |times_eaten, foods|
      Favorite.new(times_eaten, foods)
    end
  end

  private

  def most_eaten_foods(quantity = 3)
    sorted_foods.shift(quantity)
  end

  def sorted_foods
    grouped_foods.sort_by { |times_eaten, food| -times_eaten }
  end

  def grouped_foods
    foods_eaten_more_than_once.group_by { |food| food.times_eaten }
  end

  def foods_eaten_more_than_once
    Food.includes(:meals).where('foods.times_eaten > 1')
  end
end
