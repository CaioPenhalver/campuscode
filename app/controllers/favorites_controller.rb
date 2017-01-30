class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    if !@current_user.nil? && !@recipe.nil?
      @recipe.with_lock do
        favorite = Favorite.new(user: @current_user,
                    recipe: @recipe)
        if favorite.save && @recipe.update(
                          favorite_number: @recipe.favorite_number + 1)
          flash[:success] = 'Receita adicionada aos favoritos!'
          redirect_to @recipe
        else
          flash[:success] = 'Ocorre um erro!'
          redirect_to @recipe
        end
      end
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
