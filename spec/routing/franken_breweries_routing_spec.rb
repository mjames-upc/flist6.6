require "rails_helper"

RSpec.describe FrankenBreweriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/franken_breweries").to route_to("franken_breweries#index")
    end

    it "routes to #new" do
      expect(:get => "/franken_breweries/new").to route_to("franken_breweries#new")
    end

    it "routes to #show" do
      expect(:get => "/franken_breweries/1").to route_to("franken_breweries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/franken_breweries/1/edit").to route_to("franken_breweries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/franken_breweries").to route_to("franken_breweries#create")
    end

    it "routes to #update" do
      expect(:put => "/franken_breweries/1").to route_to("franken_breweries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/franken_breweries/1").to route_to("franken_breweries#destroy", :id => "1")
    end

  end
end
