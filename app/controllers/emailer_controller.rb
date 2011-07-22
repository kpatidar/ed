class EmailerController < ApplicationController

  before_filter :require_user
  layout :set_layout

  def sendmail
   recipient = params["recipient"]
   subject = params["subject"] 
   message = params["message"]
   Emailer.contact(recipient, subject, message).deliver
   return if request.xhr?
     flash[:notice] = "Message has been send successfully"
     redirect_to :controller => 'users' , :action => 'admin'
  end
end
