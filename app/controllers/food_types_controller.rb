class FoodTypesController < ApplicationController

  def index
    @food_types = FoodType.all
  end

  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.new(food_type_params)
    if @food_type.save
      redirect_to @food_type
    else
      render :new
    end
  end

  def show
    @food_type = find_food_type
  end

  def edit
    @food_type = find_food_type
  end

  def update
    @food_type = find_food_type
    if @food_type.update(food_type_params)
      redirect_to @food_type
    else
      render :edit
    end
  end

  def destroy
    find_food_type.destroy
    flash[:success] = "Tipo de refeição excluída com sucesso!"
    redirect_to food_types_url
  end

private
  def food_type_params
    params.require(:food_type).permit(:name)
  end

  def find_food_type
    FoodType.find(params[:id])
  end
end
