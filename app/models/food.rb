class Food < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods

  def self.favorites
    favorites = select('foods.*, COUNT(meal_foods.food_id) AS times_eaten')
      .joins(:meals)
      .group('foods.id, meal_foods.food_id')
      .having('COUNT(meal_foods.food_id) > 1')
      .order('times_eaten DESC')
    hash = favorites.group_by { |food| food.times_eaten }
    favs = hash.sort_by { |count, _| -count }.shift(3)
    favs.map do |count, foods|
      Favorite.new(count, foods)
    end
  end
end
