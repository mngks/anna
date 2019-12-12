class Review < ApplicationRecord
  belongs_to :donation
  belongs_to :user
  has_one :food, through: :donation
  has_one :donor, through: :food

  validates :rating, presence: true
  validates :content, presence: true

  after_validation :set_user

  def set_user
     if self.user == self.donation.user
       self.reviewed_user_id =  self.food.donor.user.id
     else
       self.reviewed_user_id = self.donation.user.id
     end
   end

   def reviewed_user
    User.find(self.reviewed_user_id)
   end

end
