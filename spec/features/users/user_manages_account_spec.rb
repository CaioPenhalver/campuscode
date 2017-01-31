require 'rails_helper'

feature 'Ordinary user' do
  scenario 'sign up' do
    user = Ordinary.new(name: 'caio',
                              email: 'caio@gmail.com',
                              password: 'qwoiruwieur',
                              password_confirmation: 'qwoiruwieur')


    visit new_ordinary_path

    fill_in 'Nome', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirmar senha', with: user.password_confirmation
    click_on 'Criar usuário'

    expect(page).to have_content user.name
    expect(page).to have_content user.email
    expect(page).to have_content 'Cadastrado com sucesso!'
  end

  scenario 'edits profile' do
    user_is_loggedin

    user_updates = Ordinary.new(name: 'caio',
                              email: 'caiopr@yahoo.com.br',
                              password: '123456',
                              password_confirmation: '123456')

    visit edit_user_path(loggedin_user)

    fill_in 'Nome', with: user_updates.name
    fill_in 'Email', with: user_updates.email
    fill_in 'Senha', with: user_updates.password
    fill_in 'Confirmar senha', with: user_updates.password_confirmation
    click_on 'Atualizar usuário'

    expect(page).to have_content user_updates.name
    expect(page).to have_content user_updates.email
    expect(page).to have_content 'Atualizado com sucesso!'
  end

  scenario 'deletes profile' do
    user_is_loggedin

    visit user_path(loggedin_user)

    click_on 'Excluir perfil'

    expect(page).to have_content 'Perfil deletado!'

  end
end
