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
    grouped_foods.sort_by { |times_eaten, food| -times_eaten }
  end

  def grouped_foods
    foods_eaten_more_than_once.group_by { |food| food.times_eaten }
  end

  def foods_eaten_more_than_once
    Food.includes(:meals).where('foods.times_eaten > 1')
  end
end
