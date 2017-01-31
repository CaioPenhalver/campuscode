require 'rails_helper'

feature 'User sees recipes' do
  scenario 'successfully' do
    recipe = create(:recipe)
    other_recipe = create(:recipe,
                          name: "Torta de morango",
                          people: 5,
                          time: 45,
                          difficulty: 'medium',
                          ingredients: 'Ovo, leite, morango, farinha e açucar',
                          procedure: 'Mecher tudo, colocar no forno e esperar por 20 min')
    difficulty = 'Facíl'
    other_difficulty = 'Média'

    visit root_path

    expect(page).to have_content recipe.name
    # expect(page).to have_content recipe.food_type.name
    # expect(page).to have_content recipe.cuisine.name
    # expect(page).to have_content recipe.people
    # expect(page).to have_content recipe.time
    # expect(page).to have_content difficulty
    # expect(page).to have_content recipe.ingredients
    # expect(page).to have_content recipe.procedure

    expect(page).to have_content other_recipe.name
    # expect(page).to have_content other_recipe.food_type.name
    # expect(page).to have_content other_recipe.cuisine.name
    # expect(page).to have_content other_recipe.people
    # expect(page).to have_content other_recipe.time
    # expect(page).to have_content other_difficulty
    # expect(page).to have_content other_recipe.ingredients
    # expect(page).to have_content other_recipe.procedure
  end
end
