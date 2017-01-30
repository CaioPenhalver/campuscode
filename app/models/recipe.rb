class Recipe < ApplicationRecord
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :ingredients, :procedure, presence:true
  mount_uploader :image, ImageUploader
  belongs_to :food_type
  belongs_to :cuisine
  belongs_to :user
  has_many :favorites

  def favorited?(user)
    return false if favorites.empty?
    favorites.each do |f|
      return f.user.id == user.id
    end
  end

  def self.recipes_by(type: type, cuisine: cuisine)
    if !(type.nil? || type.empty?) && !(cuisine.nil? || cuisine.empty?)
      where("cuisine_id = ? AND food_type_id = ?", cuisine, type)
                                    .order(:created_at).first(20)
    elsif !(type.nil? || type.empty?)
      where(food_type_id: type).order(:created_at).first(20)
    elsif !(cuisine.nil? || cuisine.empty?)
      where(cuisine_id: cuisine).order(:created_at).first(20)
    else
      order(:created_at).first(20)
    end
  end
end
