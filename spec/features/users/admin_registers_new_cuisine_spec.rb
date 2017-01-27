require 'rails_helper'

feature 'Admin user registers new cuisine' do
  scenario 'successfully' do
    cuisine = Cuisine.new(name: 'Brasileira')

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name
    click_on 'Criar cozinha'
    expect(page).to have_content cuisine.name
  end
end
