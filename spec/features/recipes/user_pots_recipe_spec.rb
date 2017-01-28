require 'rails_helper'

feature 'User posts recipe' do
  scenario 'successfully' do
    recipe = build(:recipe)
    difficulty = 'Facíl'
    visit new_recipe_path
    attach_file 'Imagem', File.join(Rails.root, 'spec', 'support', 'img', 'img_test.jpg')
    fill_in 'Nome', with: recipe.name
    select recipe.food_type.name, from: 'Tipo'
    select recipe.cuisine.name, from: 'Cozinha'
    #fill_in 'Tipo', with: recipe.food_type
    #fill_in 'Cozinha', with: recipe.cuisine
    fill_in 'Pessoas por porção', with: recipe.people
    fill_in 'Tempo de preparo', with: recipe.time
    select difficulty, from: 'Dificuldade'
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Modo de preparo', with: recipe.procedure

    click_on 'Criar receita'
    recipe_db = Recipe.find_by(name: recipe.name)
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.cuisine.name
    expect(page).to have_content recipe.people
    expect(page).to have_content recipe.time
    expect(page).to have_content difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.procedure
    expect(page).to have_xpath("//img[@src=\"#{recipe_db.image.thumb.url}\"]")
    #expect(page).to have_css("img[src='/uploads/recipe/image/1/thumb_img_test.jpg']")
  end
end
