class Favorite < ActiveModelSerializers::Model
  attr_reader :count,
              :foods

  def initialize(count, foods)
    @count = count
    @foods = foods
    @meals = 1
  end
end
