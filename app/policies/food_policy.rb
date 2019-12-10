class FoodPolicy < ApplicationPolicy
  
  def create?
    if user.donor.nil?
      return false
    else
      return true
    end
  end

  def show?
    true
  end
  
  def update?
    user.donor == record.donor
  end
  
  def destroy?
    user.donor == record.donor
  end
end
