require 'rails_helper'

RSpec.describe "franken_breweries/show", type: :view do
  before(:each) do
    @franken_brewery = assign(:franken_brewery, FrankenBrewery.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brewer Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Brewer Type/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Web/)
    expect(rendered).to match(/Hours/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
  end
end
