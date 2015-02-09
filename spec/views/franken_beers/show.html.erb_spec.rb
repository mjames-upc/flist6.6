require 'rails_helper'

RSpec.describe "franken_beers/show", type: :view do
  before(:each) do
    @franken_beer = assign(:franken_beer, FrankenBeer.create!(
      :beername => "Beername",
      :active => false,
      :rbid => 1,
      :franken_brewery => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Beername/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
