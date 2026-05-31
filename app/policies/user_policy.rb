class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    user.present?
  end

  def destroy?
    user.admin? || user.super_admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end