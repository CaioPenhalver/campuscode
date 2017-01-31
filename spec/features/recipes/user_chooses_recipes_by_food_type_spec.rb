require 'rails_helper'

feature 'User sees recipes by food type' do
  scenario 'successfully' do
    recipe_list = Array.new

    food_type_1 = create(:food_type, name: "Sobremesa")
    food_type_2 = create(:food_type, name: "Lanche")

    food_type_1_list = Array.new
    food_type_2_list = Array.new

    7.times do |i|
      food_type_1_list << create(:recipe, food_type: food_type_1)
    end
    10.times do |i|
      food_type_2_list << create(:recipe, food_type: food_type_2)
    end

    visit root_path

    select food_type_2.name, from: 'Tipo'

    click_on 'Filtrar'
    
    within("div[class='flex-container']") do
      food_type_1_list.each do |recipe|
        expect(page).not_to have_content recipe.name
      end
      food_type_2_list.each do |recipe|
        expect(page).to have_content recipe.name
      end
    end
  end
end
