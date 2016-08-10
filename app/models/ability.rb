class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index, :create], Inv
    can [:show, :update, :destroy], Inv do |inv|
      inv.user == user
    end
  end
end
