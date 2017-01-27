FactoryGirl.define do
  factory :recipe do
    name "Pão de queijo"
    food_type "lanche"
    cuisine 'mineira'
    people 3
    time 20
    difficulty 'easy'
    ingredients 'Ovo, leite, povilho'
    procedure 'Mecher tudo'
  end
end
