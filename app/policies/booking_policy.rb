class BookingPolicy < ApplicationPolicy
  def create?
    record.star.user_id != user.id
  end

  def show?
    # 2 users can see a booking : the booking maker and the star owner
    user == record.user || user == record.star.user
  end

  def update?
    # only the booking maker can edit the booking
    user == record.user
  end

  def destroy?
    # 2 users can destroy a booking : the booking maker and the star owner
    user == record.user || user == record.star.user
  end

  class Scope < Scope
    def resolve
      scope.joins(:star).where("""stars.user_id    = #{user.id} or
                                  bookings.user_id = #{user.id}""")
    end
  end
end
