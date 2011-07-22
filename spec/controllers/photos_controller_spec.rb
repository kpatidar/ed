require 'spec_helper'

describe SessionsController do
  fixtures :users
  before(:each) do
    @user = users(:prachit)
  end
  describe "POST #create" do
    it "should login the user and redirect to memories#index page" do
      post :create, :session => { :email => @user.email, :password => "123456" }
      response.should redirect_to("/memories")
    end
  end

end
