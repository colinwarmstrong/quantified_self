require 'rails_helper'

describe 'Meal Endpoints' do
  context 'GET /api/v1/meals' do
    it 'returns all the meals in the database along with their associated foods' do
      meal_1 = create(:meal)
      meal_2 = create(:meal_2)

      food_1 = create(:food)
      food_2 = create(:food_2)

      meal_food_1 = create(:meal_food, meal_id: meal_1.id, food_id: food_1.id)
      meal_food_2 = create(:meal_food, meal_id: meal_1.id, food_id: food_2.id)

      meal_food_3 = create(:meal_food, meal_id: meal_2.id, food_id: food_1.id)
      meal_food_4 = create(:meal_food, meal_id: meal_2.id, food_id: food_2.id)

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
      expect(second_meal[:foods].last[:id]).to eq(food_2.id)
      expect(second_meal[:foods].last[:name]).to eq(food_2.name)
      expect(second_meal[:foods].last[:calories]).to eq(food_2.calories)
    end
  end

  context 'GET /api/v1/meals/:meal_id/foods' do
    it 'returns the meal object and all foods associated with the meal' do
      meal_1 = create(:meal)

      food_1 = create(:food)
      food_2 = create(:food_2)

      meal_food_1 = create(:meal_food, meal_id: meal_1.id, food_id: food_1.id)
      meal_food_2 = create(:meal_food, meal_id: meal_1.id, food_id: food_2.id)

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

    it 'returns a 404 status code if the meal is not found' do
      get "/api/v1/meals/1/foods"

      expect(response.status).to eq(404)
    end
  end

  context 'POST /api/v1/meals/:meal_id/foods/:id' do
    it 'adds the food with the specified id to the specified meal' do
      meal_1 = create(:meal)
      food_1 = create(:food)

      expect(meal_1.foods.count).to eq(0)

      post "/api/v1/meals/#{meal_1.id}/foods/#{food_1.id}"

      expect(meal_1.foods.count).to eq(1)

      expect(response.status).to eq(201)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:message]).to eq("Successfully added #{food_1.name} to #{meal_1.name}")
    end

    it 'returns a 404 status code if the food cannot be found' do
      meal_1 = create(:meal)

      post "/api/v1/meals/#{meal_1.id}/foods/1"

      expect(response.status).to eq(404)
    end

    it 'returns a 404 status code if the meal cannot be found' do
      food_1 = create(:food)

      post "/api/v1/meals/1/foods/#{food_1.id}"

      expect(response.status).to eq(404)
    end
  end

  context 'DELETE /api/v1/meals/:meal_id/foods/:id' do
    it 'removes the food with the specified id from the specified meal' do
      meal_1 = create(:meal)
      food_1 = create(:food)
      meal_food_1 = create(:meal_food, meal_id: meal_1.id, food_id: food_1.id)

      expect(meal_1.foods.count).to eq(1)

      delete "/api/v1/meals/#{meal_1.id}/foods/#{food_1.id}"

      expect(meal_1.foods.count).to eq(0)

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:message]).to eq("Successfully removed #{food_1.name} from #{meal_1.name}")
    end

    it 'returns a 404 status code if the food cannot be found' do
      meal_1 = create(:meal)

      delete "/api/v1/meals/#{meal_1.id}/foods/1"

      expect(response.status).to eq(404)
    end

    it 'returns a 404 status code if the meal cannot be found' do
      food_1 = create(:food)

      delete "/api/v1/meals/1/foods/#{food_1.id}"

      expect(response.status).to eq(404)
    end
  end
end
