require 'rails_helper'

feature 'User sees recipes by cuisine' do
  scenario 'successfully' do
    recipe_list = Array.new

    cuisine_1 = create(:cuisine, name: "Italiana")
    cuisine_2 = create(:cuisine, name: "Espanhola")

    cuisine_1_list = Array.new
    cuisine_2_list = Array.new

    7.times do |i|
      cuisine_1_list << create(:recipe, cuisine: cuisine_1)
    end
    10.times do |i|
      cuisine_2_list << create(:recipe, cuisine: cuisine_2)
    end

    visit root_path

    select cuisine_2.name, from: 'Cozinha'

    click_on 'Filtrar'
    within("div[class='flex-container']") do
      cuisine_1_list.each do |recipe|
        expect(page).not_to have_content recipe.name
      end
      cuisine_2_list.each do |recipe|
        expect(page).to have_content recipe.name
      end
    end
  end
end
