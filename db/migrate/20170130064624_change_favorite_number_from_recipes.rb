class ChangeFavoriteNumberFromRecipes < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :favorite_number, :integer, default: 0
  end
end
