require 'rails_helper'

feature 'User' do
  scenario 'favorites recipe successfully' do
    user_is_loggedin

    recipe = create(:recipe)

    visit recipe_path(recipe)

    #click_on "a#favorite-button"
    page.find("#favorite-button").click

    expect(page).to have_content 'Receita adicionada aos favoritos!'
    expect(page).to have_css("p[id='favorites']", text: '1')
  end

  scenario 'disfavorites recipe successfully' do
    user_is_loggedin
    recipe = create(:recipe, favorite_number: 1)
    favorite = create(:favorite, user: loggedin_user, recipe: recipe)

    visit recipe_path(recipe)

    #click_on "a#disfavorite-button"
    page.find("#disfavorite-button").click

    expect(page).to have_content 'Receita removida dos favoritos!'
    expect(page).to have_css("p[id='favorites']", text: '0')
  end
end
