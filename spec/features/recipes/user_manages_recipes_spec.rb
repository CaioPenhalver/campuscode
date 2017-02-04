require 'rails_helper'

feature 'User' do
  scenario 'posts recipe successfully' do
    user_is_loggedin

    recipe = build(:recipe, user: loggedin_user)
    difficulty = 'Facíl'

    visit new_recipe_path

    attach_file 'Imagem', File.join(Rails.root, 'spec', 'support', 'img', 'img_test.jpg')
    fill_in 'Nome', with: recipe.name
    select recipe.food_type.name, from: 'Tipo'
    select recipe.cuisine.name, from: 'Cozinha'
    fill_in 'Pessoas por porção', with: recipe.people
    fill_in 'Tempo de preparo', with: recipe.time
    select difficulty, from: 'Dificuldade'
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Modo de preparo', with: recipe.procedure

    click_on 'Criar receita'

    recipe_db = Recipe.find_by(name: recipe.name)
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.cuisine.name
    expect(page).to have_content recipe.people
    expect(page).to have_content recipe.time
    expect(page).to have_content difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.procedure
    expect(page).to have_xpath("//img[@src=\"#{recipe_db.image.medium.url}\"]")
    #expect(page).to have_css("img[src='/uploads/recipe/image/1/thumb_img_test.jpg']")
  end

  scenario 'updates recipe successfully' do
    user = User.create(name: 'caio',
                        email: 'caio@gmail.com',
                        password: 'qwoiruwieur',
                        password_confirmation: 'qwoiruwieur')
    food_type = create(:food_type, name: 'Lanche')
    old_recipe = create(:recipe, name: "Pão de queijo de Minas",
                                food_type: food_type,
                                people: 3,
                                time: 20,
                                difficulty: 'hard',
                                ingredients: 'Ovo, leite, povilho',
                                procedure: 'Colocar no fogão',
                                user: user)
    recipe = build(:recipe)
    difficulty = 'Difícil'
    login(user.password, user.email)
    visit edit_recipe_path(old_recipe)

    attach_file 'Imagem', File.join(Rails.root, 'spec', 'support', 'img', 'img_test.jpg')
    fill_in 'Nome', with: recipe.name
    select recipe.food_type.name, from: 'Tipo'
    select difficulty, from: 'Dificuldade'
    fill_in 'Modo de preparo', with: recipe.procedure

    click_on 'Atualizar receita'

    recipe_db = Recipe.find_by(name: recipe.name)
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.cuisine.name
    expect(page).to have_content recipe.people
    expect(page).to have_content recipe.time
    expect(page).to have_content difficulty
    expect(page).to have_content recipe.procedure
    expect(page).to have_xpath("//img[@src=\"#{recipe_db.image.medium.url}\"]")
    #expect(page).to have_css("img[src=\"#{recipe_db.image.thumb.url}\"]")
  end

  scenario 'updates recipe unsuccessfully' do
    user = User.create(name: 'caio',
                        email: 'caio@gmail.com',
                        password: 'qwoiruwieur',
                        password_confirmation: 'qwoiruwieur')
    other_user = User.create(name: 'Amanda',
                        email: 'amanda@gmail.com',
                        password: 'asdf',
                        password_confirmation: 'asdf')
    food_type = create(:food_type, name: 'Lanche')
    recipe = create(:recipe, name: "Pão de queijo de Minas",
                                food_type: food_type,
                                people: 3,
                                time: 20,
                                difficulty: 'hard',
                                ingredients: 'Ovo, leite, povilho',
                                procedure: 'Colocar no fogão',
                                user: user)

    login(other_user.password, other_user.email)

    visit edit_recipe_path(recipe)

    expect(current_path).to eq root_path
    expect(page).to have_content "Acesso não autorizado!"
  end

  scenario 'deletes recipe successfully' do
    user_is_loggedin

    recipe = create(:recipe, user: loggedin_user)

    visit recipe_path(recipe)

    click_on 'Excluir receita'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Receita excluída como sucesso!'
  end

  scenario 'deletes recipe unsuccessfully' do
    user_is_loggedin
    other_user = create(:user, email: 'anotheruser@gmail.com')
    recipe = create(:recipe, user: other_user)


    visit recipe_path(recipe)

    expect(page).not_to have_content 'Excluir receita'
  end
end
