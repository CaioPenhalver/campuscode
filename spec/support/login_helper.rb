module LoginHelper
  def admin_does_login(password, email)
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Senha', with: password
    click_on 'Entrar'
  end
  def admin_user_is_loggedin
    admin_user = Admin.create(name: 'caio',
                              email: 'caio@gmail.com',
                              password: 'qwoiruwieur',
                              password_confirmation: 'qwoiruwieur')
    admin_does_login(admin_user.password, admin_user.email)
  end
end
