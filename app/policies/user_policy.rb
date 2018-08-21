class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  def index?
    true
  end

  def edit?
    is_user_creator?
  end

  def update?
    is_user_creator?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def is_user_creator?
    record == user
  end

end
