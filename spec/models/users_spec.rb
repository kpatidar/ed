require 'spec_helper'

describe UsersController do
  fixtures :users
  before(:each) do
    @logged_in_user = sign_in_as users(:test)
  end
  
  describe "GET #edit" do
    it "should render form for editing user's profile" do
      get "edit", :id => @logged_in_user.id.to_s
      assigns(:user).should_not be_nil
      response.should render_template("edit")
    end
  end
  
  describe "PUT #update" do
    it "should update email" do
      put "update", :id => @logged_in_user.id.to_s, :user => {:email => "new_test@example.com"}
      @logged_in_user.email.should eq("new_test@example.com")
      response.should redirect_to("/")
    end
    
    it "should not update password given password_confirmation nil" do
      put "update", :id => @logged_in_user.id.to_s, :user => {:password => "new_password", :password_confirmation => nil}
      User.authenticate(@logged_in_user.email, 'new_password').should be_nil
      response.should render_template("edit")
    end
    
    it "should update password given valid password and password_confirmation" do
      put "update", :id => @logged_in_user.id.to_s, :user => {:password => "new_password", :password_confirmation => "new_password"}
      User.authenticate(@logged_in_user.email, 'new_password').should_not be_nil
      response.should redirect_to("/")
    end
    
    it "should upate the email_contacts of user" do
      put "update", :id => @logged_in_user.id.to_s, :user =>{:contacts => "abc@example.com, xyz@example.com"}
      @logged_in_user.email_contacts.should eq(%w(abc@example.com xyz@example.com))
      response.should redirect_to("/")
    end
  end
end
