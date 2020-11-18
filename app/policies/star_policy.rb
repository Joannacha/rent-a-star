class StarPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
