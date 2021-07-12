# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "admin" || user.role == "superadmin"
      can :manage, :all
    else
      can :read, Album
    end
  end
end

