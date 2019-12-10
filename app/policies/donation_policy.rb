class DonationPolicy < ApplicationPolicy

def index?
  record.user == user
end

def create?
  true
end

def update?
  record.food.donor == user.donor
end

end
