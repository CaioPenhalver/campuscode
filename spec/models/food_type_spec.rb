require 'rails_helper'

RSpec.describe FoodType, type: :model do
  it 'should be valid' do
    food_type = FoodType.create
    expect(food_type).not_to be_valid
    expect(food_type.errors[:name]).to include("não pode ficar em branco")
  end
end
