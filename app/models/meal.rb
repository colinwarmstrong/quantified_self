class Meal < ApplicationRecord
  validates_presence_of :name
  
  has_many :foods
end
