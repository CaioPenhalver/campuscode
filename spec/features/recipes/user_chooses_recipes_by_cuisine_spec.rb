require 'rails_helper'

feature 'User sees recipes by cuisine' do
  scenario 'successfully' do
    recipe_list = Array.new

    cuisine_1 = create(:cuisine, name: "Italiana")
    cuisine_2 = create(:cuisine, name: "Espanhola")

    7.times { |i| create(:recipe, cuisine: cuisine_1) }
    10.times { |i| create(:recipe, cuisine: cuisine_2) }



    visit root_path

    select cuisine_2.name, from: 'Cozinha'

    click_on 'Filtrar'
    within("div[class='flex-container']") do
      expect(page).not_to have_content cuisine_1.name
      expect(page).to have_content cuisine_2.name
    end
  end
end
