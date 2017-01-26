class AddColumnsToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :difficulty, :integer
    add_column :recipes, :ingredients, :text
    add_column :recipes, :procedure, :text
  end
end
