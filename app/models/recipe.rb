class Recipe < ApplicationRecord
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :ingredients, :procedure, presence:true
  mount_uploader :image, ImageUploader
  belongs_to :food_type
  belongs_to :cuisine
  belongs_to :user
  has_many :favorites
  has_many :users_like, through: :favorites, source: :user, class_name: 'User'

  def self.recipes_by(type: type, cuisine: cuisine, sort: sort)
    puts sort
    order_by = :created_at
    if sort.to_i == SortHelper::MOST_FAVORITED[1]
      puts '<<<<<<<<<<<<<<<<<<_____________>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
      order_by = :favorite_number
    end

    if !(type.nil? || type.empty?) && !(cuisine.nil? || cuisine.empty?)
      where("cuisine_id = ? AND food_type_id = ?", cuisine, type)
                                    .order(order_by).last(20)
    elsif !(type.nil? || type.empty?)
      where(food_type_id: type).order(order_by).last(20)
    elsif !(cuisine.nil? || cuisine.empty?)
      where(cuisine_id: cuisine).order(order_by).last(20)
    else
      order(order_by).last(20)
    end
  end
end
