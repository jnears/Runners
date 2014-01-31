require "spec_helper"

describe IntranetsController do
  describe "routing" do

    it "routes to #index" do
      get("/intranets").should route_to("intranets#index")
    end

    it "routes to #new" do
      get("/intranets/new").should route_to("intranets#new")
    end

    it "routes to #show" do
      get("/intranets/1").should route_to("intranets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/intranets/1/edit").should route_to("intranets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/intranets").should route_to("intranets#create")
    end

    it "routes to #update" do
      put("/intranets/1").should route_to("intranets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/intranets/1").should route_to("intranets#destroy", :id => "1")
    end

  end
end
