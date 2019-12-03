class Donor < ApplicationRecord
  belongs_to :user

  has_many :foods, dependent: :destroy
  has_many :donations, through: :foods
end
