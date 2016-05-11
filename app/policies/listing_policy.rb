class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def write?
    user && (record.user_id == user.id)
  end

end
