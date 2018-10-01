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

      binding.pry
      
      expect(food[:id]).to eq(food_1.id)
      expect(food[:name]).to eq(food_1.name)
      expect(food[:calories]).to eq(food_1.calories)
    end
  end
end
