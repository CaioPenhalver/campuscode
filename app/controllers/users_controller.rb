# class UsersController < ApplicationController
#
#   def show
#     @ordinary = find_ordinary_user
#   end
#
#   def edit
#     @ordinary = find_ordinary_user
#   end
#
#   def update
#     @ordinary = find_ordinary_user
#     if @ordinary.update(ordinary_user_params)
#       flash[:success] = 'Atualizado com sucesso!'
#       redirect_to @ordinary
#     else
#       flash.now[:success] = 'Não foi possível cadastrar!'
#       render :edit
#     end
#   end
#
#   def destroy
#     find_ordinary_user.destroy
#     flash[:success] = 'Perfil deletado!'
#     redirect_to root_url
#   end
# end
