require "rails_helper"

RSpec.describe FrankenRatingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/franken_ratings").to route_to("franken_ratings#index")
    end

    it "routes to #new" do
      expect(:get => "/franken_ratings/new").to route_to("franken_ratings#new")
    end

    it "routes to #show" do
      expect(:get => "/franken_ratings/1").to route_to("franken_ratings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/franken_ratings/1/edit").to route_to("franken_ratings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/franken_ratings").to route_to("franken_ratings#create")
    end

    it "routes to #update" do
      expect(:put => "/franken_ratings/1").to route_to("franken_ratings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/franken_ratings/1").to route_to("franken_ratings#destroy", :id => "1")
    end

  end
end
