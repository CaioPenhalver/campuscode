require 'rails_helper'

feature 'User sees last 20 recipes' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    recipe_list = Array.new
    interation_number = 30

    interation_number.times do |i|
      create(:recipe,
            name: "Recipe #{i}",
            food_type: food_type,
            cuisine: cuisine)
    end

    visit root_path

    recipe_list = Recipe.order(:created_at).all

    interation_number.times do |i|
      if i <= 19
        expect(page).to have_content recipe_list[i].name
      else
        expect(page).not_to have_content recipe_list[i].name
      end
    end
  end
end
