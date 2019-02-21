module UsersHelper

  def all_roles
    return Role.all.collect {|r|[r.name, r.id]}
  end
end
