class ReviewPolicy < ApplicationPolicy

def index?
  record.donation.user == user || record.donation.food.donor.user == user
end

def create?
  record.donation.user == user || record.donation.food.donor.user == user
end

end
