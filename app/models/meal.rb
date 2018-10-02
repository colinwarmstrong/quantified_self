class Meal < ApplicationRecord
  validates_presence_of :name

  has_many :meal_foods
  has_many :foods, through: :meal_foods
end
