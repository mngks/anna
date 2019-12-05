class Donor < ApplicationRecord
  belongs_to :user

  has_many :foods, dependent: :destroy
  has_many :donations, through: :foods

  validates :full_name, presence: true
  validates :contact_number, uniqueness: true, presence: true
end
