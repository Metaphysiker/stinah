require "rails_helper"

RSpec.describe OfferersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/offerers").to route_to("offerers#index")
    end

    it "routes to #new" do
      expect(:get => "/offerers/new").to route_to("offerers#new")
    end

    it "routes to #show" do
      expect(:get => "/offerers/1").to route_to("offerers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/offerers/1/edit").to route_to("offerers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/offerers").to route_to("offerers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/offerers/1").to route_to("offerers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/offerers/1").to route_to("offerers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/offerers/1").to route_to("offerers#destroy", :id => "1")
    end
  end
end
