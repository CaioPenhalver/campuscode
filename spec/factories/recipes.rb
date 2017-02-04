FactoryGirl.define do
  factory :recipe do
    name { Faker::Lorem.characters(15) }
    food_type
    cuisine
    people 3
    time 20
    difficulty 'easy'
    ingredients { Faker::Lorem.characters(20) }
    procedure { Faker::Lorem.characters(20) }
    user
  end
end
