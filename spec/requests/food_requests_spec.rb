require 'rails_helper'

describe 'Food Endpoints' do
  context 'GET /api/v1/foods' do
    it 'returns all foods currently in the database' do
      food_1 = create(:food)
      food_2 = create(:food_2)

      get '/api/v1/foods'

      expect(response).to be_successful

      foods = JSON.parse(response.body, symbolize_names: true)
      food = foods.first

      expect(foods).to be_an(Array)
      expect(foods.length).to eq(2)

      expect(food[:id]).to eq(food_1.id)
      expect(food[:name]).to eq(food_1.name)
      expect(food[:calories]).to eq(food_1.calories)
    end
  end

  context 'GET /api/v1/foods/:id' do
    it 'returns the food object with the specific :id the user passes in' do
      food_1 = create(:food)

      get "/api/v1/foods/#{food_1.id}"

      expect(response).to be_successful

      food = JSON.parse(response.body, symbolize_names: true)

      expect(food).to be_a(Hash)
      expect(food[:id]).to eq(food_1.id)
      expect(food[:name]).to eq(food_1.name)
      expect(food[:calories]).to eq(food_1.calories)
    end

    it 'returns a 404 if the food is not found' do
      get '/api/v1/foods/1'

      expect(response.status).to eq(404)
    end
  end

  context 'POST /api/v1/foods' do
    it 'allows a user to create a new food with the correct parameters' do
      name = 'hamburger'
      calories = '550'

      post "/api/v1/foods", params: {"food": { "name": name, "calories": calories}}

      expect(response).to be_successful

      food = JSON.parse(response.body, symbolize_names: true)

      expect(food[:id]).to eq(Food.last.id)
      expect(food[:name]).to eq(name)
      expect(food[:calories]).to eq(calories.to_i)
    end
  end
end
