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

    fill_in 'Nome', with: recipe.name
    fill_in 'Tipo', with: recipe.food_type
    fill_in 'Cozinha', with: recipe.cuisine
    fill_in 'Pessoas por porção', with: recipe.people
    fill_in 'Tempo de preparo', with: recipe.time
    select recipe.difficulty, from: 'Dificuldade'
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Modo de preparo', with: recipe.procedure

    click_on 'Criar receita'

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
