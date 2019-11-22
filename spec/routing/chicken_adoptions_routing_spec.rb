require "rails_helper"

RSpec.describe ChickenAdoptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/chicken_adoptions").to route_to("chicken_adoptions#index")
    end

    it "routes to #new" do
      expect(:get => "/chicken_adoptions/new").to route_to("chicken_adoptions#new")
    end

    it "routes to #show" do
      expect(:get => "/chicken_adoptions/1").to route_to("chicken_adoptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/chicken_adoptions/1/edit").to route_to("chicken_adoptions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/chicken_adoptions").to route_to("chicken_adoptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/chicken_adoptions/1").to route_to("chicken_adoptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/chicken_adoptions/1").to route_to("chicken_adoptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/chicken_adoptions/1").to route_to("chicken_adoptions#destroy", :id => "1")
    end
  end
end
