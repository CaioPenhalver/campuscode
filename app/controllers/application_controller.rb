class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  helper_method :cuisine_list,
                :food_type_list,
                :current_user,
                :sort_option,
                :admin?,
                :loggedin?

private

  def sort_option
    [SortHelper::CREATED_AT, SortHelper::MOST_FAVORITED]
  end

  def cuisine_list
    Cuisine.all
  end

  def food_type_list
    FoodType.all
  end

  def current_user(user = User)
    if session[:user_id]
        @current_user ||= user.find(session[:user_id])
    end
  end

  def authenticate_admin_user!
    if current_user(Admin)
      @current_user
    else
      redirect_to login_path
    end
  end

  def authenticate_user!
    if current_user(User)
      @current_user
    else
      redirect_to login_path
    end
  end

  def admin?
    current_user
    !@current_user.nil? && @current_user.type == 'Admin'
  end

  def loggedin?
    current_user
    !@current_user.nil?
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
