class AddFavoriteNumberToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :favorite_number, :integer, default: 0
  end
end
