class AddReferenceToMeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :meals, :meal_food, foreign_key: true
  end
end
