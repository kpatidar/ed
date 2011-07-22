require 'spec_helper'

describe TwitterController do
  fixtures :users
  before(:each) do
    @logged_in_user = sign_in_as users(:test)
  end
    
  describe "GET #auth" do
    it "should set token and secret to session and redirect to twitter for authorization" do
      get "auth"
      session[:request_token].should_not be_nil
      session[:request_token_secret].should_not be_nil
      response.should redirect_to(assigns(:request_token).authorize_url)
    end
  end
  
  describe "GET #callback" do
    it "should not set user twitter's access token and redirect to home" do
      get "callback", :oauth_verifier => "ABCKDKDIEDDLEILSKIELKEDKDL"
      @logged_in_user.twitter_user_id.should be_nil
      @logged_in_user.twitter_screen_name.should be_nil
      @logged_in_user.twitter_access_token.should be_nil
      @logged_in_user.twitter_access_secret.should be_nil
      response.should redirect_to(edit_user_path(@logged_in_user))
    end
  end
end
