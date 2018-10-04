require 'rails_helper'

describe FavoritesPresenter, type: :model do
  describe 'Instance Methods' do
    context '#favorites' do
      it 'returns an array of favorite objects associated with most eaten foods' do
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

        expected = FavoritesPresenter.new.favorites

        expect(expected).to be_an(Array)
        expect(expected.length).to eq(3)

        expect(expected[0].count).to eq(5)
        expect(expected[0].foods.length).to eq(2)
        expect(expected[0].foods[0].name).to eq(food_1.name)
        expect(expected[0].foods[0].calories).to eq(food_1.calories)
        expect(expected[0].foods[1].name).to eq(food_2.name)
        expect(expected[0].foods[1].calories).to eq(food_2.calories)

        expect(expected[1].count).to eq(4)
        expect(expected[1].foods.length).to eq(1)
        expect(expected[1].foods[0].name).to eq(food_3.name)
        expect(expected[1].foods[0].calories).to eq(food_3.calories)

        expect(expected[2].count).to eq(3)
        expect(expected[2].foods.length).to eq(1)
        expect(expected[2].foods[0].name).to eq(food_4.name)
        expect(expected[2].foods[0].calories).to eq(food_4.calories)
      end
    end
  end
end
