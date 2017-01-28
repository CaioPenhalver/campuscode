require 'rails_helper'

feature 'User admin' do
  scenario 'registers new food type successfully' do
    food_type = FoodType.new(name: 'Sobremesa')

    visit new_food_type_path

    fill_in 'Tipo de refeição', with: food_type.name

    click_on 'Criar tipo'

    expect(page).to have_content food_type.name
  end

  scenario 'updates food type successfully' do
    food_type = FoodType.create(name: 'Sobremesa')
    other_food_type = FoodType.new(name: 'Lanche')

    visit edit_food_type_path(food_type)

    fill_in 'Tipo de refeição', with: other_food_type.name

    click_on 'Atualizar tipo'

    expect(page).to have_content other_food_type.name
  end

  scenario 'deletes cuisine successfully' do
    admin_user_is_loggedin

    food_type = FoodType.create(name: 'Sobremesa')

    visit food_type_path(food_type)

    click_on 'Excluir tipo de refeição'
    expect(page).to have_content "Tipo de refeição excluída com sucesso!"
  end
end
