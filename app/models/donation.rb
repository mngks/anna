class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :food

  has_one :review, dependent: :destroy
end
