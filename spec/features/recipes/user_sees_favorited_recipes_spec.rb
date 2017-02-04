require 'rails_helper'

feature 'User sees favorited recipes' do
  scenario 'successfully' do
    favorites = create_list(:favorite, 20)
    recipes = create_list(:recipe, 15)

    visit root_path

    select "Mais populares", from: 'Ordenar por'
    click_on 'Filtrar'

    favorites.each do |favorite|
      expect(page).to have_content favorite.recipe.name
    end

    recipes.each do |recipe|
      expect(page).not_to have_content recipe.name
    end
  end
end
