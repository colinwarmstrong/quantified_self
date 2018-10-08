class Favorite < ActiveModelSerializers::Model
  attr_reader :times_eaten,
              :foods

  def initialize(times_eaten, foods)
    @times_eaten = times_eaten
    @foods       = foods
  end
end
