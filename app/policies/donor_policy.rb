class DonorPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end
  
  # def show?
  #   user == record.user
  # end
  
  # def edit?
  #   user == record.user
  # end
  
  # def update?
  #   user == record.user
  # end
  
  # def destroy?
  #   user == record.user
  # end
  
end
