class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update, :destroy, :show]
  before_action :load_current_user, only:[:edit, :update, :destroy]

  def destroy
    find_ordinary_user.destroy
    session[:user_id] = nil
    flash[:success] = 'Perfil deletado!'
    redirect_to root_url
  end

  def show
    @user = find_user
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    if @user.update(user_params)
      flash[:success] = 'Atualizado com sucesso!'
      redirect_to @user
    else
      flash.now[:success] = 'Não foi possível cadastrar!'
      render :edit
    end
  end

  private

  def find_user
    User.find(params[:id])
  end

  def user_params
    params.require(:ordinary).permit(:name,
                                      :email,
                                      :password,
                                      :password_confirmation)
  end

  def load_current_user
    @user = find_admin_user
    if !(@current_user == @user)
      flash[:danger] = "Acesso não autorizado!"
      redirect_to root_url
    end
  end

end
