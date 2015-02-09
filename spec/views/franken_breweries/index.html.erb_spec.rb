require 'rails_helper'

RSpec.describe "franken_breweries/index", type: :view do
  before(:each) do
    assign(:franken_breweries, [
      FrankenBrewery.create!(
        :brewer_name => "Brewer Name",
        :address => "Address",
        :city => "City",
        :district => "District",
        :rbid => 1,
        :active => false,
        :founded => 2,
        :brewer_type => "Brewer Type",
        :score => 1.5,
        :lat => 1.5,
        :lon => 1.5,
        :web => "Web",
        :hours => "Hours",
        :description => "MyText",
        :phone => "Phone"
      ),
      FrankenBrewery.create!(
        :brewer_name => "Brewer Name",
        :address => "Address",
        :city => "City",
        :district => "District",
        :rbid => 1,
        :active => false,
        :founded => 2,
        :brewer_type => "Brewer Type",
        :score => 1.5,
        :lat => 1.5,
        :lon => 1.5,
        :web => "Web",
        :hours => "Hours",
        :description => "MyText",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of franken_breweries" do
    render
    assert_select "tr>td", :text => "Brewer Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Brewer Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Web".to_s, :count => 2
    assert_select "tr>td", :text => "Hours".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
