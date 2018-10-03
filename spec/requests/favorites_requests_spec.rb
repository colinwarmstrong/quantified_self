require 'rails_helper'

describe 'Favorites Endpoints' do
  context 'GET /api/v1/favorite_foods' do
    it 'returns data on the foods that were eaten the most frequently' do
      meal_1 = Meal.create(name: 'breakfast')
      meal_2 = Meal.create(name: 'lunch')
      meal_3 = Meal.create(name: 'dinner')

      food_1 = Food.create(name: 'Banana', calories: 200)
      food_2 = Food.create(name: 'Meatloaf', calories: 800)
      food_3 = Food.create(name: 'Orange', calories: 250)
      food_4 = Food.create(name: 'Hot Dog', calories: 500)

      create(:meal_food, food_id: food_1.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_3.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_3.id)

      create(:meal_food, food_id: food_2.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_3.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_3.id)

      create(:meal_food, food_id: food_3.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_3.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_3.id, meal_id: meal_2.id)

      create(:meal_food, food_id: food_4.id, meal_id: meal_2.id)

      get '/api/v1/favorite_foods'

      expect(response).to be_successful

      favorites = JSON.parse(response.body, symbolize_names: true)

      first_favorite = favorites.first

      binding.pry

      first_favorite_foods = first_favorite[:foods]

      second_favorite = favorites.last
      second_favorite_foods = second_favorite[:foods]

      expect(favorites).to be_an(Array)
      expect(favorites.length).to eq(2)

      expect(first_favorite[:timesEaten]).to eq(4)

      expect(first_favorite_foods).to be_an(Array)
      expect(first_favorite_foods.length).to eq(2)
      expect(first_favorite_foods.first[:name]).to eq(food_1.name)
      expect(first_favorite_foods.first[:calories]).to eq(food_1.calories)
      expect(first_favorite_foods.first[:mealsWhenEaten]).to be_an(Array)
      expect(first_favorite_foods.first[:mealsWhenEaten]).to eq([meal_1.name, meal_3.name])
      expect(first_favorite_foods.last[:name]).to eq(food_2.name)
      expect(first_favorite_foods.last[:calories]).to eq(food_2.calories)
      expect(first_favorite_foods.last[:mealsWhenEaten]).to be_an(Array)
      expect(first_favorite_foods.last[:mealsWhenEaten]).to eq([meal_2.name, meal_3.name])

      expect(second_favorite_foods).to be_an(Array)
      expect(second_favorite_foods.length).to eq(3)
      expect(second_favorite_foods.first[:name]).to eq(food_3.name)
      expect(second_favorite_foods.first[:calories]).to eq(food_3.calories)
      expect(second_favorite_foods.first[:mealsWhenEaten]).to be_an(Array)
      expect(second_favorite_foods.first[:mealsWhenEaten]).to eq([meal_1.name, meal_2.name])
    end
  end
end
