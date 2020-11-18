class ReviewPolicy < ApplicationPolicy
  def create?
    @record.boooking.user == user
  end

  def show?

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
