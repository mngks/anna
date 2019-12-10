class Message < ApplicationRecord
  belongs_to :donation
  belongs_to :user
  has_one :food, through: :donation
  validates_presence_of :content, :user_id, :donation_id, :receiving_user_id
  before_validation :set_user

  def message_time
    created_at.strftime("%m/%d/%y")
  end


  def set_user
   if self.user == self.donation.user
     self.receiving_user_id = self.food.donor.user.id
   else
     self.receiving_user_id = self.donation.user.id
   end
 end

  def receiving_user
    User.find(self.receiving_user_id)
  end

  def check_if_read(user)
    self.update(read: true) if self.user != user && !self.read
  end

end
