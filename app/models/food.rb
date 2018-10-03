class Food < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods

  def self.favorites
    favorites_hash = select('foods.*')
      .joins(:meals)
      .group('foods.id')
      .having('COUNT(meal_foods.food_id) > 1')
      .count
    food_ids = favorites_hash.keys.sort
    meal_counts = favorites_hash.values.sort
    food_objects = where(id: food_ids)

    nested_array = meal_counts.zip(food_objects)

    foods_by_count = nested_array.inject({}) do |acc, food|
      if acc[food.first].nil?
        acc[food.first] = [food.last]
      else
        acc[food.first] << food.last
      end
      acc
    end
    
    foods = foods_by_count.sort_by do |count, _|
      -count
    end.to_h
    foods.map do |count, foods|
      Favorite.new(count, foods)
    end
  end

  # def self.favorites
  #   favorites_hash = joins(:meals).group('meal_foods.food_id').having('COUNT(meal_foods.food_id) > 1').count
  #   x = favorites_hash.sort_by do |food_id, times_eaten|
  #     times_eaten
  #   end
  #   binding.pry
  # end
end
