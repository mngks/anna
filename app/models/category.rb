class Category < ApplicationRecord
  has_many :food_categories
  has_many :foods, through: :food_categories
  mount_uploader :photo, PhotoUploader
end
