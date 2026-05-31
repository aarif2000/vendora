class ProductPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user.vendor? || user.admin? || user.super_admin?
  end

  def update?
    return true if user.admin? || user.super_admin?

    record.user_id == user.id
  end

  def destroy?
    user.admin? || user.super_admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all
      elsif user.vendor?
        scope.where(user_id: user.id)
      else
        scope.all # customers can view products
      end
    end
  end
end