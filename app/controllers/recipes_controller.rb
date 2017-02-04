class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :load_recipe_filter, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    load_cuisine_and_food_type
  end

  def show
    @recipe = find_recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = @current_user.id

    if @recipe.save
      flash[:success] = "Receita #{@recipe.name} foi postada!"
      redirect_to @recipe
    else
      flash.now[:danger] = "Ocorreu um erro!"
      load_cuisine_and_food_type
      render :new
    end
  end

  def edit
    load_cuisine_and_food_type
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      load_cuisine_and_food_type
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'Receita excluída como sucesso!'
    redirect_to root_url
  end

  def filter
    @recipes = Recipe.recipes_by(type: params[:food_type],
                                  cuisine: params[:cuisine],
                                  sort: params[:sort])
    render 'welcome/index'
  end

  def search
    @recipes = Recipe.where('name LIKE ?', "%#{params[:search]}%").all
    params[:search] = ''
    render 'welcome/index'
  end

  private

  def recipe_params
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

  def find_recipe
    Recipe.find(params[:id])
  end

  def load_recipe_filter
    @recipe = find_recipe
    if !@current_user.recipes.include?(@recipe)
      flash[:danger] = "Acesso não autorizado!"
      redirect_to root_url
    end
  end
end
