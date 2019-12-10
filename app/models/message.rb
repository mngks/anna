class Message < ApplicationRecord
  belongs_to :donation
  belongs_to :user
  validates_presence_of :content, :user_id, :donation_id

  def message_time
    created_at.strftime("%m/%d/%y")
  end
end
