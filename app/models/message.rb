class Message < ApplicationRecord
  belongs_to :donation
  belongs_to :user
end
