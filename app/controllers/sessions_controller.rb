class SessionsController < ApplicationController

  def login
  end

  def authentication
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Bem vindo!!!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou senha incorreto!'
      render :new ###########??????
    end
  end



  def login_params
    params.permit(:email, :password)
  end
end
