class UsersController < ApplicationController


  def show
    @user = find_user
  end

  def edit
    @user = find_user
  end

  def destroy
    find_ordinary_user.destroy
    session[:user_id] = nil
    flash[:success] = 'Perfil deletado!'
    redirect_to root_url
  end


  private

  def find_user
    User.find(params[:id])
  end
end
