require "spec_helper"

describe PropuestasController do
  describe "routing" do

    it "routes to #index" do
      get("/propuestas").should route_to("propuestas#index")
    end

    it "routes to #new" do
      get("/propuestas/new").should route_to("propuestas#new")
    end

    it "routes to #show" do
      get("/propuestas/1").should route_to("propuestas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/propuestas/1/edit").should route_to("propuestas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/propuestas").should route_to("propuestas#create")
    end

    it "routes to #update" do
      put("/propuestas/1").should route_to("propuestas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/propuestas/1").should route_to("propuestas#destroy", :id => "1")
    end

  end
end
