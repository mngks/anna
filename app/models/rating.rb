class Rating < ApplicationRecord
  belongs_to :donation
  belongs_to :user

end
