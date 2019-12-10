class UserPolicy < ApplicationPolicy

  def create?
    true
  end
  
  def show?
    true
  end
  
  def update?
    record == user
  end
  
  def destroy?
    record == user
  end
  
end
