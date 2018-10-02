class AddReferenceToFoods < ActiveRecord::Migration[5.1]
  def change
    add_reference :foods, :meal_food, foreign_key: true
  end
end
