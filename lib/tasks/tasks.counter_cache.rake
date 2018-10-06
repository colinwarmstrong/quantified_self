desc 'Counter cache for project has many tasks'

task task_counter: :environment do
  Food.reset_column_information
  Food.pluck(:id).find_each do |food|
    Food.reset_counters food.id, :meal_foods
  end
end
