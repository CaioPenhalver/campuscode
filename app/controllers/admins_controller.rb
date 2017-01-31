class AdminsController < UsersController

  # def new
  #   @admin = Admin.new
  # end
  #
  # def edit
  #   @admin = find_admin_user
  # end
  #
  # def show
  #   @admin = find_admin_user
  # end

  def create
    @admin = Admin.new(user_params)
    if @admin.save
      flash[:success] = 'Cadastrado com sucesso!'
      session[:user_id] = @admin.id
      redirect_to @admin
    else
      flash.now[:success] = 'Não foi possível cadastrar!'
      render :new
    end
  end

  # def update
  #   @admin = find_admin_user
  #   if @admin.update(admin_user_params)
  #     flash[:success] = 'Atualizado com sucesso!'
  #     redirect_to @admin
  #   else
  #     flash.now[:success] = 'Não foi possível cadastrar!'
  #     render :edit
  #   end
  # end

  private

  def find_admin_user
    Admin.find(params[:id])
  end

  # def load_current_user
  #   @admin = find_admin_user
  #   if !(@current_user == @admin)
  #     flash[:danger] = "Acesso não autorizado!"
  #     redirect_to root_url
  #   end
  # end

end
