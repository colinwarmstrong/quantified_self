FactoryBot.define do
  factory :food do
    name { 'pizza' }
    calories { 400 }

    factory :food_2 do
      name { 'banana' }
      calories { 200 }
    end
  end
end
