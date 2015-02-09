require "rails_helper"

RSpec.describe FrankenBeersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/franken_beers").to route_to("franken_beers#index")
    end

    it "routes to #new" do
      expect(:get => "/franken_beers/new").to route_to("franken_beers#new")
    end

    it "routes to #show" do
      expect(:get => "/franken_beers/1").to route_to("franken_beers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/franken_beers/1/edit").to route_to("franken_beers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/franken_beers").to route_to("franken_beers#create")
    end

    it "routes to #update" do
      expect(:put => "/franken_beers/1").to route_to("franken_beers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/franken_beers/1").to route_to("franken_beers#destroy", :id => "1")
    end

  end
end
