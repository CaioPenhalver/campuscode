require 'rails_helper'

feature 'Admin user logs in' do
  scenario 'successfully' do
    admin_user = Admin.create(name: 'caio',
                              email: 'caio@gmail.com',
                              password: 'qwoiruwieur',
                              password_confirmation: 'qwoiruwieur')


    visit login_path

    fill_in 'Email', with: admin_user.email
    fill_in 'Senha', with: admin_user.password
    click_on 'Entrar'

    expect(page).to have_content 'Bem vindo!!!'
  end
end
