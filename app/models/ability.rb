class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note
    can :create, Note
        unless user.nil?
          can :update, Note, { user_id: user.id }
        end
  end
  
end
