require 'rails_helper'

feature 'User sees recipe' do
  scenario 'successfully' do
    recipe = Recipe.create(name: "Pão de queijo",
                          food_type: "sobremesa",
                          cuisine: 'mineira',
                          people: 3,
                          time: 20,
                          difficulty: 'easy',
                          ingredients: 'Ovo, leite, povilho',
                          procedure: 'Mecher tudo')
    difficulty = 'Facíl'
    visit recipe_path(recipe)
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
