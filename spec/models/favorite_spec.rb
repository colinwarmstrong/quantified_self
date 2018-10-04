require 'rails_helper'

describe Favorite, type: :model do
  describe 'Validations' do
    it 'exists' do
      food_1 = Food.create(name: 'Apple', calories: 200)
      food_2 = Food.create(name: 'Orange', calories: 250)

      favorite = Favorite.new(5, [food_1, food_2])

      expect(favorite).to be_a(Favorite)
    end

    it 'has attributes' do
      food_1 = Food.create(name: 'Apple', calories: 200)
      food_2 = Food.create(name: 'Orange', calories: 250)

      count = 5
      foods = [food_1, food_2]

      favorite = Favorite.new(count, foods)

      expect(favorite.count).to eq(count)
      expect(favorite.foods).to eq(foods)
    end
  end
end
