class Food < ApplicationRecord
  belongs_to :donor
  has_many :donations, dependent: :destroy
end
