class JobPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def show?
    user == record.user || user == record.talent.user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
