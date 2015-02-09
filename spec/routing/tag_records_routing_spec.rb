require "rails_helper"

RSpec.describe TagRecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag_records").to route_to("tag_records#index")
    end

    it "routes to #new" do
      expect(:get => "/tag_records/new").to route_to("tag_records#new")
    end

    it "routes to #show" do
      expect(:get => "/tag_records/1").to route_to("tag_records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tag_records/1/edit").to route_to("tag_records#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tag_records").to route_to("tag_records#create")
    end

    it "routes to #update" do
      expect(:put => "/tag_records/1").to route_to("tag_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag_records/1").to route_to("tag_records#destroy", :id => "1")
    end

  end
end
