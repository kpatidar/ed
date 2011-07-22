class HomeController < ApplicationController
  def login
  end

  def logout
    session[:current_user] = nil
    redirect_to :action => 'login'
  end
  def show
   redirect_to :action => 'login'
  end
  def check_login
    password = get_encryp_pass(params[:password])
    user = User.find(:first,:conditions=>[" login_name = ? and login_password = ? ",params[:login],password] )
    if user 
      session[:current_user] = user
      if user.login_role.downcase == "admin" then
        flash[:note]="Welcome admin " + user.login_name
        redirect_to :controller =>'users',:action => 'admin'
      elsif(user.login_role.downcase == "employee") then
        flash[:note]="Welcome employee " + user.login_name
	redirect_to :controller =>'users', :action => 'employee'
      end 
    else
      flash[:notice] = "User id or user password is not correct. please enter valid id and password"
      redirect_to :action => 'login'
    end 
  end
end
