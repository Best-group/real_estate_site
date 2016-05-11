class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def read?
    true
  end

  def write?
    false
  end

  def index?
    read?
  end

  def show?
    read?
  end

  def create?
    write?
  end

  def new?
    write?
  end

  def update?
    write?
  end

  def edit?
    write?
  end

  def destroy?
    write?
  end

  def scope
    Pundit.policy_scope!(user, Listing.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
