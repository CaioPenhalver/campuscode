class SessionsController < ApplicationController

  def new
  end

  def admin_authentication
    admin_user = Admin.find_by(email: login_params[:email])
    if admin_user && admin_user.authenticate(login_params[:password])
      session[:user_id] = admin_user.id
      flash[:success] = 'Bem vindo!!!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou senha incorreto!'
      render :new
    end
  end

  def login_params
    params.permit(:email, :password)
  end
end
