class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one :donor, dependent: :destroy
  has_many :foods, through: :donor

  has_many :donations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :username, uniqueness: true, presence: true
  serialize :pickup_days

def reviews_received
    Review.where(reviewed_user_id: self.id)
  end

  def avg_rating
    if self.reviews_received.count == 0
      return 0
    else
      total_rating = 0
      reviews_received.each do |review|
        total_rating += review.rating
      end
      (total_rating / reviews_received.count).to_i
    end
  end

  def blank_stars
    5 - avg_rating.to_i
  end

  def unread_messages
    unless Message.where(receiving_user_id: self.id, read:false).empty?
      return Message.where(receiving_user_id: self.id, read: false)
    else
      return []
    end
  end
end
