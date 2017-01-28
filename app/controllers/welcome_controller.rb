class WelcomeController < ApplicationController

  def index
    @recipes = Recipe.order(:created_at).first(20)
  end
end
