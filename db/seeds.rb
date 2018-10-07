puts "Seeding...\n\n"

meal_1 = Meal.create(name: 'Breakfast')
meal_2 = Meal.create(name: 'Lunch')
meal_3 = Meal.create(name: 'Dinner')
meal_4 = Meal.create(name: 'Snack')

food_1  = Food.create(name: 'Eggs', calories: 350)
food_2  = Food.create(name: 'Bacon', calories: 400)
food_3  = Food.create(name: 'Orange', calories: 250)
food_4  = Food.create(name: 'Turkey Sandwich', calories: 500)
food_5  = Food.create(name: 'Peanut Butter and Jelly', calories: 450)
food_6  = Food.create(name: 'Chips', calories: 200)
food_7  = Food.create(name: 'Candy Bar', calories: 250)
food_8  = Food.create(name: 'Spaghetti', calories: 600)
food_9  = Food.create(name: 'Taco', calories: 300)
food_10 = Food.create(name: 'Meatloaf', calories: 500)
food_11 = Food.create(name: 'Beef Jerky', calories: 100)
food_12 = Food.create(name: 'Granola Bar', calories: 150)

MealFood.create(meal_id: meal_1.id, food_id: food_1.id)
MealFood.create(meal_id: meal_1.id, food_id: food_2.id)
MealFood.create(meal_id: meal_1.id, food_id: food_3.id)
MealFood.create(meal_id: meal_1.id, food_id: food_3.id)
MealFood.create(meal_id: meal_1.id, food_id: food_3.id)

MealFood.create(meal_id: meal_2.id, food_id: food_4.id)
MealFood.create(meal_id: meal_2.id, food_id: food_5.id)
MealFood.create(meal_id: meal_2.id, food_id: food_6.id)
MealFood.create(meal_id: meal_2.id, food_id: food_12.id)

MealFood.create(meal_id: meal_3.id, food_id: food_8.id)
MealFood.create(meal_id: meal_3.id, food_id: food_9.id)
MealFood.create(meal_id: meal_3.id, food_id: food_9.id)
MealFood.create(meal_id: meal_3.id, food_id: food_9.id)
MealFood.create(meal_id: meal_3.id, food_id: food_9.id)
MealFood.create(meal_id: meal_3.id, food_id: food_10.id)
MealFood.create(meal_id: meal_3.id, food_id: food_10.id)
MealFood.create(meal_id: meal_3.id, food_id: food_10.id)
MealFood.create(meal_id: meal_3.id, food_id: food_10.id)
MealFood.create(meal_id: meal_3.id, food_id: food_10.id)
MealFood.create(meal_id: meal_3.id, food_id: food_6.id)
MealFood.create(meal_id: meal_3.id, food_id: food_3.id)

MealFood.create(meal_id: meal_4.id, food_id: food_9.id)
MealFood.create(meal_id: meal_4.id, food_id: food_7.id)
MealFood.create(meal_id: meal_4.id, food_id: food_11.id)
MealFood.create(meal_id: meal_4.id, food_id: food_12.id)
MealFood.create(meal_id: meal_4.id, food_id: food_12.id)

puts "Created #{Meal.count} meals."
puts "Created #{Food.count} foods."
puts "Created #{MealFood.count} meal foods."
puts "\nSeeding complete."
