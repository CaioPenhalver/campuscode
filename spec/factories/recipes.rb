FactoryGirl.define do
  factory :recipe do
    name { Faker::Lorem.characters(20) }
    food_type
    cuisine
    people 3
    time 20
    difficulty 'easy'
    ingredients 'Ovo, leite, povilho'
    procedure 'Mecher tudo'
    user
  end
end
