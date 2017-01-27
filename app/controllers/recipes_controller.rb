class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_param)

    if @recipe.save
      flash.now[:success] = "Receita #{@recipe.name} foi postada!"
      redirect_to @recipe
    elsif @recipe.invalid?
      flash.now[:danger] = "Ocorreu um erro!"
      render :new
    else
      flash.now[:danger] = "Ocorreu um erro!"
      render :new
    end
  end

  private

  def recipe_param
    params.require(:recipe).permit(:name,
                                  :food_type,
                                  :cuisine,
                                  :people,
                                  :time,
                                  :difficulty,
                                  :ingredients,
                                  :procedure)
  end
end
