class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  def login
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Tchau volte sempre!"
    redirect_to root_url
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


private
  def login_params
    params.permit(:email, :password)
  end
end
