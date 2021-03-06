require 'spec_helper'

describe UsersController do
  fixtures :users
  describe "GET #edit" do
    before(:each) do
      sign_in_as users(:admin)
    end
    it "assigns the requested memory as @memory and render edit template" do
      @user = users(:employee)
      get :edit, :id => @user.id.to_s
      assigns(:user).should_not be_nil
      response.should render_template('edit')
    end
  end

end
