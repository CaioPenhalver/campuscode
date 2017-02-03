class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_many :recipes
  has_many :favorites
  has_many :favorited_recipes, through: :favorites,
            source: :recipe, class_name: 'Recipe'
=begin
has_many :favorite_recipes, through: :favorites,
          source: :recipe, class_name: 'Recipe'
#It was retrieving Favorites instead of Recipes,
  however, when the field ":favorite_recipes"
  was changed to ":favorited_recipes" it started to
  retrieve Recipes
=end

  def favorite_recipes
    favorites.each do |f|
      f.recipe
    end
  end

  def ==(other_user)
    !other_user.nil? &&
    other_user.name == name &&
    other_user.email == email &&
    other_user.id == id &&
    other_user.type == type
  end
end
