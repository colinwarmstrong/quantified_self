class Favorite < ActiveModelSerializers::Model
  attr_reader :count,
              :foods
              
  def initialize(count, foods)
    @count = count
    @foods = foods
  end
end
