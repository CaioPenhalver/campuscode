class AddFavoriteNumberToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :favorite_number, :integer
  end
end
