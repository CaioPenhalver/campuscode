require 'rails_helper'

feature 'User looks for recipes' do
  scenario 'from home page' do
    recipes = ['Bolo de morango', 'Torta de morango',
      'Bolo de chocolate', 'Torta de chocolate', 'Torta de limão']
    recipes.each { |r| create(:recipe, name: r)}

    visit root_path

    within("nav") do
      fill_in "search", with: 'ToRtA'
      click_on 'Buscar'
    end
    expect(page).to have_content 'Torta de chocolate'
    expect(page).to have_content 'Torta de limão'
    expect(page).to have_content 'Torta de morango'
  end

  scenario 'from new recipe page' do
    recipes = ['Bolo de morango', 'Torta de morango',
      'Bolo de chocolate', 'Torta de chocolate', 'Torta de limão']
    recipes.each { |r| create(:recipe, name: r)}

    visit root_path

    within("nav") do
      fill_in "search", with: 'ToRtA'
      click_on 'Buscar'
    end
    expect(page).to have_content 'Torta de chocolate'
    expect(page).to have_content 'Torta de limão'
    expect(page).to have_content 'Torta de morango'
  end
end
