require 'rails_helper'

feature 'Admin user' do
  scenario 'registers new cuisine successfully' do
    admin_user_is_loggedin

    cuisine = Cuisine.new(name: 'Brasileira')

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name
    click_on 'Criar cozinha'
    expect(page).to have_content cuisine.name
  end

  scenario 'updates cuisine successfully' do
    admin_user_is_loggedin

    cuisine = Cuisine.create(name: 'Brasileira')
    other_cuisine = Cuisine.new(name: 'Espanhola')

    visit edit_cuisine_path(cuisine)

    fill_in 'Cozinha', with: other_cuisine.name
    click_on 'Atualizar cozinha'
    expect(page).to have_content other_cuisine.name
  end

  scenario 'deletes cuisine successfully' do
    admin_user_is_loggedin

    cuisine = Cuisine.create(name: 'Brasileira')

    visit cuisine_path(cuisine)

    click_on 'Excluir cozinha'
    expect(page).to have_content "Cozinha excluída com sucesso!"
  end
end
