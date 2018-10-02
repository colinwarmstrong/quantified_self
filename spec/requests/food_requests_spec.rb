require 'rails_helper'

describe 'Food Endpoints' do
  context 'GET /api/v1/foods' do
    it 'returns all foods currently in the database' do
      meal = create(:meal)
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
      meal = create(:meal)
      food_1 = create(:food)

      get "/api/v1/foods/#{food_1.id}"

      expect(response).to be_successful

      food = JSON.parse(response.body, symbolize_names: true)

      expect(food).to be_a(Hash)
      expect(food[:id]).to eq(food_1.id)
      expect(food[:name]).to eq(food_1.name)
      expect(food[:calories]).to eq(food_1.calories)
    end

    it 'returns a 404 status code if the food is not found' do
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

    it 'returns a 400 status code if the food is not successfully created' do
      name = 'hamburger'
      calories = ''

      post '/api/v1/foods', params: {'food': { 'name': name, 'calories': calories}}

      expect(response.status).to eq(400)
    end
  end

  context 'PATCH /api/v1/foods/:id' do
    it 'allows a user to update an existing food' do
      meal = create(:meal)
      food_1 = create(:food)

      updated_name = 'candy bar'
      updated_calories = '250'

      patch "/api/v1/foods/#{food_1.id}", params: {'food': {'name': updated_name, 'calories': updated_calories}}

      expect(response).to be_successful

      food = JSON.parse(response.body, symbolize_names: true)

      expect(food[:id]).to eq(food_1.id)
      expect(food[:name]).to eq(updated_name)
      expect(food[:calories]).to eq(updated_calories.to_i)
    end

    it 'returns a 400 status code if the food is not successfully updated' do
      meal = create(:meal)
      food_1 = create(:food)

      updated_name = ''
      updated_calories = '250'

      patch "/api/v1/foods/#{food_1.id}", params: {'food': {'name': updated_name, 'calories': updated_calories}}

      expect(response.status).to eq(400)
    end
  end

  context 'DELETE /api/v1/foods/:id' do
    it 'allows a user to delete the specified food and returns a 204 status code' do
      meal = create(:meal)
      food_1 = create(:food)

      expect(Food.count).to eq(1)

      delete "/api/v1/foods/#{food_1.id}"

      expect(response.status).to eq(204)

      expect(Food.count).to eq(0)
    end

    it "returns a 404 status code if the food is not found" do
      delete '/api/v1/foods/1'

      expect(response.status).to eq(404)
    end
  end
end
