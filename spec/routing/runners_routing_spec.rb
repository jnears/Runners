require "spec_helper"

describe RunnersController do
  describe "routing" do

    it "routes to #index" do
      get("/runners").should route_to("runners#index")
    end

    it "routes to #new" do
      get("/runners/new").should route_to("runners#new")
    end

    it "routes to #show" do
      get("/runners/1").should route_to("runners#show", :id => "1")
    end

    it "routes to #edit" do
      get("/runners/1/edit").should route_to("runners#edit", :id => "1")
    end

    it "routes to #create" do
      post("/runners").should route_to("runners#create")
    end

    it "routes to #update" do
      put("/runners/1").should route_to("runners#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/runners/1").should route_to("runners#destroy", :id => "1")
    end

  end
end
