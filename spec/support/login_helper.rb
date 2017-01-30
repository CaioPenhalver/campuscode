module LoginHelper
  def login(password, email)
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
    login(admin_user.password, admin_user.email)
  end
  def user_is_loggedin
    @user = create(:user, type:'Ordinary')
    login(@user.password, @user.email)
  end
  def loggedin_user
    @user
  end
end
