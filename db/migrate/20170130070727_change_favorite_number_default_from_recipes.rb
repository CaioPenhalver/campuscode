class ChangeFavoriteNumberDefaultFromRecipes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :recipes, :favorite_number, 0
  end
end
