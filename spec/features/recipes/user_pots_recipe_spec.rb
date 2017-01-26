require 'rails_helper'

feature 'User posts recipe' do
  scenario 'successfully' do
    recipe = Recipe.new(name: "Pão de queijo",
                          food_type: "sobremesa",
                          cuisine: 'mineira',
                          people: 3,
                          time: 20,
                          difficulty: 'easy',
                          ingredients: 'Ovo, leite, povilho',
                          procedure: 'Mecher tudo')

    visit new_recipe_path

    fill_in 'Name', with: recipe.name
    fill_in 'Food type', with: recipe.food_type
    fill_in 'Cuisine', with: recipe.cuisine
    fill_in 'People', with: recipe.people
    fill_in 'Time', with: recipe.time
    fill_in 'Difficulty', with: recipe.difficulty
    fill_in 'Ingredients', with: recipe.ingredients
    fill_in 'Procedure', with: recipe.procedure

    click_on 'Create Recipe'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type
    expect(page).to have_content recipe.cuisine
    expect(page).to have_content recipe.people
    expect(page).to have_content recipe.time
    expect(page).to have_content recipe.difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.procedure
  end
end
