class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one :donor, dependent: :destroy
  has_many :foods, through: :donor

  has_many :donations, dependent: :destroy
  has_many :ratings, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def avg_rating
    if ratings.count == 0
      return 0
    else
      total_rating = 0
      ratings.each do |rating|
        total_rating += rating.rate
      end
      (total_rating / ratings.count).to_i
    end
  end

  def blank_stars
    5 - avg_rating.to_i
  end
end
