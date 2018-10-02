class CreateMealFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_foods do |t|
      t.references :meal, foreign_key: true
      t.references :food, foreign_key: true
    end
  end
end
