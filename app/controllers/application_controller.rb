require 'digest/sha2'
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  def current_user
    session[:current_user]
  end

  def name
    first_name + ' ' + last_name
  end 



  def get_encryp_pass(orig_pass)
   Digest::MD5.hexdigest(orig_pass)
  end

  def set_layout
    if current_user.login_role.downcase == 'admin'
      'admin_layout'
    elsif current_user.login_role.downcase == 'employee'
      'employee_layout'
    else
      'application'
    end
  end

  def require_user
    redirect_to login_home_index_path and return if session[:current_user].blank?
  end


#   def require_admin
#     if current_user.login_role.to_s.downcase == 'admin'
#       redirect_to logout_home_index_path
#     end
#   end

end

