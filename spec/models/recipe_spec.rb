require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'should be valid' do
    recipe = Recipe.create()
    expect(recipe).not_to be_valid
    expect(recipe.errors[:name]).to include("não pode ficar em branco")
    expect(recipe.errors[:ingredients]).to include("não pode ficar em branco")
    expect(recipe.errors[:procedure]).to include("não pode ficar em branco")
  end
end
