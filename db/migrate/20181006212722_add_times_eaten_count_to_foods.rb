class AddTimesEatenCountToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :times_eaten, :integer, default: 0
  end
end
