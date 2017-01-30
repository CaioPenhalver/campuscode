class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_many :recipes
  has_many :favorites

  def ==(other_user)
    other_user.name == name &&
    other_user.email == email &&
    other_user.id == id &&
    other_user.type == type
  end
end
