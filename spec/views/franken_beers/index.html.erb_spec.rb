require 'rails_helper'

RSpec.describe "franken_beers/index", type: :view do
  before(:each) do
    assign(:franken_beers, [
      FrankenBeer.create!(
        :beername => "Beername",
        :active => false,
        :rbid => 1,
        :franken_brewery => nil
      ),
      FrankenBeer.create!(
        :beername => "Beername",
        :active => false,
        :rbid => 1,
        :franken_brewery => nil
      )
    ])
  end

  it "renders a list of franken_beers" do
    render
    assert_select "tr>td", :text => "Beername".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
