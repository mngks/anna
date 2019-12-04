class Food < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :donor
  has_many :food_categories, dependent: :destroy
  has_many :categories, through: :food_categories
  has_many :donations, dependent: :destroy
  
  mount_uploader :photo, PhotoUploader
end
