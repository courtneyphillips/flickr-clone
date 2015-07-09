class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :manage, Picture, :user => { :id => user.id } 
      end
      can :destroy, Picture do |image|
        image.try(:user) == user
      end
      can :edit, Picture do |image|
        image.try(:user) == user
      end
      #
      # can :edit, Picture do |image|
      #

    end

end
