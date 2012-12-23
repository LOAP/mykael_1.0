class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      #  POST PERMISSIONS FOR USER
      can :create, Post
      can :update, Post do |post|
        post.try(:user) == user
      end
      can :read, Post do |post|
        post.try(:user) == user
      end
      can :edit, Post do |post|
        post.try(:user) == user
      end
      can :destroy, Post do |post|
        post.try(:user) == user
      end
      #  PROFILE PERMISSIONS FOR USER
      can :read, Profile
      can :update, Profile do |profile|
        profile.try(:user) == user
      end
      can :edit, Profile do |profile|
        profile.try(:user) == user
      end
      #  BIO PERMISSIONS FOR USER
      can :manage, Bio do |bio|
        bio.try(:user) == user
      end
      can :read, Bio
      #  PAGES PERMISSIONS FOR USER

    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
