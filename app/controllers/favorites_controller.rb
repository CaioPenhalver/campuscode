class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    if !@current_user.nil? && !@recipe.nil?
      if Favorite.new(user: @current_user, recipe: @recipe).save
        flash[:success] = 'Receita adicionada aos favoritos!'
        redirect_to @recipe
      else
        flash[:success] = 'Ocorre um erro!'
        redirect_to @recipe
      end
    else
      flash[:success] = 'Ocorre um erro!'
      redirect_to root_url
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    if !@current_user.nil? && !@recipe.nil?
      favorite = Favorite.find_by(user: @current_user, recipe: @recipe)
      favorite.destroy if !favorite.nil?
      flash[:success] = 'Receita removida dos favoritos!'
      redirect_to @recipe
    else
      flash[:success] = 'Ocorre um erro!'
      redirect_to @recipe
    end
  end
end
