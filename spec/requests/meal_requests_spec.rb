require 'rails_helper'

describe 'Meal Endpoints' do
  context 'GET /api/v1/meals' do
    it 'returns all the meals in the database along with their associated foods' do
      meal_1 = create(:meal)
      meal_2 = create(:meal_2)

      food_1 = create(:food, meal_id: meal_1.id)
      food_2 = create(:food_2, meal_id: meal_1.id)

      food_3 = create(:food, meal_id: meal_2.id)
      food_4 = create(:food_2, meal_id: meal_2.id)

      get '/api/v1/meals'

      expect(response).to be_successful

      meals = JSON.parse(response.body, symbolize_names: true)
      first_meal = meals.first
      second_meal = meals.last

      expect(meals).to be_an(Array)
      expect(meals.length).to eq(2)

      expect(first_meal).to be_a(Hash)
      expect(first_meal[:id]).to eq(meal_1.id)
      expect(first_meal[:name]).to eq(meal_1.name)
      expect(first_meal[:foods]).to be_an(Array)
      expect(first_meal[:foods].first[:id]).to eq(food_1.id)
      expect(first_meal[:foods].first[:name]).to eq(food_1.name)
      expect(first_meal[:foods].first[:calories]).to eq(food_1.calories)

      expect(second_meal).to be_a(Hash)
      expect(second_meal[:id]).to eq(meal_2.id)
      expect(second_meal[:name]).to eq(meal_2.name)
      expect(second_meal[:foods]).to be_an(Array)
      expect(second_meal[:foods].last[:id]).to eq(food_4.id)
      expect(second_meal[:foods].last[:name]).to eq(food_4.name)
      expect(second_meal[:foods].last[:calories]).to eq(food_4.calories)
    end
  end

  context 'GET /api/v1/meals/:meal_id/foods' do
    it 'returns all the foods associated with the specified meal' do
      meal_1 = create(:meal)

      food_1 = create(:food, meal_id: meal_1.id)
      food_2 = create(:food_2, meal_id: meal_1.id)

      get "/api/v1/meals/#{meal_1.id}/foods"

      expect(response).to be_successful

      meal = JSON.parse(response.body, symbolize_names: true)

      expect(meal).to be_a(Hash)
      expect(meal[:id]).to eq(meal_1.id)
      expect(meal[:name]).to eq(meal_1.name)

      foods = meal[:foods]
      food = foods.first

      expect(foods).to be_an(Array)
      expect(food).to be_a(Hash)
      expect(food[:id]).to eq(food_1.id)
      expect(food[:name]).to eq(food_1.name)
      expect(food[:calories]).to eq(food_1.calories)
    end
  end
end
