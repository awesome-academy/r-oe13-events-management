class Ability
  include CanCan::Ability
  def initialize(user)
    @user = user || User.new
    role = @user.role_name
    if role == Settings.role_admin
      can :manager, :all
    elsif role == Settings.role_organizer
      can :create, Post
    else
      can :read, :all
    end
  end
end
