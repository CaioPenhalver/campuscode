require 'rails_helper'

feature 'User sees recipes' do
  scenario 'successfully' do
    recipe = create(:recipe)
    difficulty = 'Facíl'
    visit root_path
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type
    expect(page).to have_content recipe.cuisine
    expect(page).to have_content recipe.people
    expect(page).to have_content recipe.time
    expect(page).to have_content difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.procedure
  end
end
