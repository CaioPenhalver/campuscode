class CuisinesController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to @cuisine
    else
      render :new
    end
  end

  def show
    @cuisine = find_cuisine
  end

  def edit
    @cuisine = find_cuisine
  end

  def update
    @cuisine = find_cuisine
    if @cuisine.update(cuisine_params)
      flash[:success] = "A cozinha #{@cuisine.name} foi atualizada com sucesso!"
      redirect_to @cuisine
    else
      flash.now[:danger] = "Não foi possível atualizar!"
      render :edit
    end
  end

  def destroy
    find_cuisine.destroy
    flash[:success] = "Cozinha excluída com sucesso!"
    redirect_to cuisines_url
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def find_cuisine
    Cuisine.find(params[:id])
  end
end
