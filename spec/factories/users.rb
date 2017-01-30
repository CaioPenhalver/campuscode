FactoryGirl.define do
  factory :user do
    name "Renata"
    email "#{Random.new}@gmail.com"
    password 'qwoiruwieur'
    password_confirmation 'qwoiruwieur'
  end
end
