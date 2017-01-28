class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    load_cuisine_and_food_type
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_param)

    if @recipe.save
      flash[:success] = "Receita #{@recipe.name} foi postada!"
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
                                  :food_type_id,
                                  :cuisine_id,
                                  :people,
                                  :time,
                                  :difficulty,
                                  :ingredients,
                                  :procedure,
                                  :image)
  end

  def load_cuisine_and_food_type
    @food_types = FoodType.all
    @cuisines = Cuisine.all
  end
end
