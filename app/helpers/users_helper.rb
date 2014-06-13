module UsersHelper

  def empl(user)
    empl = user.full_name
    return link_to empl, user_path(user)
  end
end
