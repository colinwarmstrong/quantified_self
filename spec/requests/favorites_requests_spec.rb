require 'rails_helper'

describe 'Favorites Endpoints' do
  context 'GET /api/v1/favorite_foods' do
    it 'returns data on foods eaten the most frequently' do
      meal_1 = Meal.create(name: 'breakfast')
      meal_2 = Meal.create(name: 'lunch')
      meal_3 = Meal.create(name: 'dinner')

      food_1 = Food.create(name: 'Banana', calories: 200)
      food_2 = Food.create(name: 'Meatloaf', calories: 800)
      food_3 = Food.create(name: 'Orange', calories: 250)
      food_4 = Food.create(name: 'Hot Dog', calories: 500)
      food_5 = Food.create(name: 'Taco', calories: 400)
      food_6 = Food.create(name: 'Ice Cream', calories: 500)

      create(:meal_food, food_id: food_1.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_3.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_3.id)
      create(:meal_food, food_id: food_1.id, meal_id: meal_3.id)

      create(:meal_food, food_id: food_2.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_3.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_3.id)
      create(:meal_food, food_id: food_2.id, meal_id: meal_3.id)

      create(:meal_food, food_id: food_3.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_3.id, meal_id: meal_1.id)
      create(:meal_food, food_id: food_3.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_3.id, meal_id: meal_2.id)

      create(:meal_food, food_id: food_4.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_4.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_4.id, meal_id: meal_2.id)

      create(:meal_food, food_id: food_5.id, meal_id: meal_2.id)
      create(:meal_food, food_id: food_5.id, meal_id: meal_2.id)

      create(:meal_food, food_id: food_6.id, meal_id: meal_3.id)

      get '/api/v1/favorite_foods'

      expect(response).to be_successful

      favorites = JSON.parse(response.body, symbolize_names: true)

      favorite_1 = favorites[0]
      favorite_foods_1 = favorite_1[:foods]

      favorite_2 = favorites[1]
      favorite_foods_2 = favorite_2[:foods]

      favorite_3 = favorites[2]
      favorite_foods_3 = favorite_3[:foods]

      expect(favorites).to be_an(Array)
      expect(favorites.length).to eq(3)

      expect(favorite_1[:timesEaten]).to eq(5)

      expect(favorite_foods_1).to be_a(Array)
      expect(favorite_foods_1.length).to eq(2)

      expect(favorite_foods_1.first[:name]).to eq(food_1.name).or eq(food_2.name)
      expect(favorite_foods_1.first[:calories]).to eq(food_1.calories).or eq(food_2.calories)
      expect(favorite_foods_1.first[:mealsWhenEaten]).to include(meal_1.name)

      expect(favorite_foods_1.last[:name]).to eq(food_1.name).or eq(food_2.name)
      expect(favorite_foods_1.last[:calories]).to eq(food_1.calories).or eq(food_2.calories)
      expect(favorite_foods_1.last[:mealsWhenEaten]).to include(meal_3.name)

      expect(favorite_2[:timesEaten]).to eq(4)

      expect(favorite_foods_2).to be_an(Array)
      expect(favorite_foods_2.length).to eq(1)

      expect(favorite_foods_2.first[:name]).to eq(food_3.name)
      expect(favorite_foods_2.first[:calories]).to eq(food_3.calories)
      expect(favorite_foods_2.first[:mealsWhenEaten]).to be_an(Array)
      expect(favorite_foods_2.first[:mealsWhenEaten]).to include(meal_1.name)
      expect(favorite_foods_2.first[:mealsWhenEaten]).to include(meal_2.name)

      expect(favorite_3[:timesEaten]).to eq(3)

      expect(favorite_foods_3).to be_an(Array)
      expect(favorite_foods_3.length).to eq(1)

      expect(favorite_foods_3.first[:name]).to eq(food_4.name)
      expect(favorite_foods_3.first[:calories]).to eq(food_4.calories)
      expect(favorite_foods_3.first[:mealsWhenEaten]).to be_an(Array)
      expect(favorite_foods_3.first[:mealsWhenEaten]).to eq([meal_2.name])
    end
  end
end
