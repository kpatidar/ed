require "spec_helper"

describe HomeController do
  describe "routing" do
    it "should route to #home_page" do
      get("home/home_page").should route_to("home#home_page")
    end

    it "should route to #login_page" do
      get("home/login").should route_to("home#login")
    end
  end
end

