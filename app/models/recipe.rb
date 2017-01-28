class Recipe < ApplicationRecord
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :ingredients, :procedure, presence:true
  mount_uploader :image, ImageUploader
end
