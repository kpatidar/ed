require "spec_helper"

describe UsersController do
  describe "routing" do
   it "should route to #index" do
      get("/users").should route_to("users#index")
    end

    it "should route to #new" do
     get("/users/new").should route_to("users#new")
    end

    it "should route to #create" do
      post("/users").should route_to("users#create")
    end

    it "should route to #show" do
      get("/users/1").should route_to("users#show", :id => "1")
    end

    it "shoud route to #edit" do
      get("/users/1/edit").should route_to("users#edit", :id => "1")
    end

    it "should route to #update" do
      put("/users/1").should route_to("users#update", :id => "1")
    end
    
    it "should route to #change_password" do
      post("users/modify_password").should route_to("users#modify_password")
    end

    
    it "should route to #change_password" do
      get("users/change_password").should route_to("users#change_password")
    end

    it "should route to #admin" do
      get("users/admin").should route_to("users#admin")
    end

    it "should route to #employee" do
      get("users/employee").should route_to("users#employee")
    end
  end
end