class OrdinariesController < ApplicationController

  def new
    @ordinary = Ordinary.new
  end

  def create
    @ordinary = Ordinary.new(ordinary_user_params)
    if @ordinary.save
      flash[:success] = 'Cadastrado com sucesso!'
      redirect_to @ordinary
    else
      flash.now[:success] = 'Não foi possível cadastrar!'
      render :new
    end
  end

  def show
    @ordinary = find_ordinary_user
  end

  def edit
    @ordinary = find_ordinary_user
  end

  def update
    @ordinary = find_ordinary_user
    if @ordinary.update(ordinary_user_params)
      flash[:success] = 'Atualizado com sucesso!'
      redirect_to @ordinary
    else
      flash.now[:success] = 'Não foi possível cadastrar!'
      render :edit
    end
  end

  def destroy
    find_ordinary_user.destroy
    flash[:success] = 'Perfil deletado!'
    redirect_to root_url
  end

  private

  def ordinary_user_params
    params.require(:ordinary).permit(:name,
                                      :email,
                                      :password,
                                      :password_confirmation)
  end

  def find_ordinary_user
    Ordinary.find(params[:id])
  end
end
