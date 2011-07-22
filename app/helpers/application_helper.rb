module ApplicationHelper
  def is_admin?
   (current_user.login_role == 'admin') ? true : false
  end
end
