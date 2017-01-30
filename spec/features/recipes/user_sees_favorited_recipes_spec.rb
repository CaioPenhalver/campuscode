require 'rails_helper'

feature 'User sees favorited recipes' do
  scenario 'successfully' do
    recipes = Array.new
    30.times do |i|
      recipes << create(:recipe, name: "Recipe #{i}")
    end
    like_num = 25
    10.times do |i|
      user = create(:user,
              name: "User #{i}",
              email: "Email #{i}")
      like_num.times do |j|
        Favorite.create(user: user, recipe: recipes[j])
      end
      like_num = like_num - 1
    end

    visit root_path

    select "Mais populares", from: 'Ordenar por'
    click_on 'Filtrar'

    15.times do |i|
      expect(page).to have_content "Recipe #{i}"
    end
  end
end
