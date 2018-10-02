class AddForeignKeyToFoodsTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :foods, :meal, foreign_key: true
  end
end
