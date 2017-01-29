require 'rails_helper'

feature 'User sees recipes by food type' do
  scenario 'successfully' do
    recipe_list = Array.new

    food_type_1 = create(:food_type, name: "Sobremesa")
    food_type_2 = create(:food_type, name: "Lanche")

    7.times { |i| create(:recipe, food_type: food_type_1) }
    10.times { |i| create(:recipe, food_type: food_type_2) }

    visit root_path

    select food_type_2.name, from: 'Tipo'

    click_on 'Filtrar'
    within("div[class='flex-container']") do
      expect(page).not_to have_content food_type_1.name
      expect(page).to have_content food_type_2.name
    end
  end
end
