require "spec_helper"

describe RelatedsController do
  describe "routing" do

    it "routes to #index" do
      get("/relateds").should route_to("relateds#index")
    end

    it "routes to #new" do
      get("/relateds/new").should route_to("relateds#new")
    end

    it "routes to #show" do
      get("/relateds/1").should route_to("relateds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/relateds/1/edit").should route_to("relateds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/relateds").should route_to("relateds#create")
    end

    it "routes to #update" do
      put("/relateds/1").should route_to("relateds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/relateds/1").should route_to("relateds#destroy", :id => "1")
    end

  end
end
