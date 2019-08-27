require "rails_helper"

RSpec.describe HomeOffersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/home_offers").to route_to("home_offers#index")
    end

    it "routes to #new" do
      expect(:get => "/home_offers/new").to route_to("home_offers#new")
    end

    it "routes to #show" do
      expect(:get => "/home_offers/1").to route_to("home_offers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/home_offers/1/edit").to route_to("home_offers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/home_offers").to route_to("home_offers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/home_offers/1").to route_to("home_offers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/home_offers/1").to route_to("home_offers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/home_offers/1").to route_to("home_offers#destroy", :id => "1")
    end
  end
end
