require 'rails_helper'

RSpec.describe "franken_beers/edit", type: :view do
  before(:each) do
    @franken_beer = assign(:franken_beer, FrankenBeer.create!(
      :beername => "MyString",
      :active => false,
      :rbid => 1,
      :franken_brewery => nil
    ))
  end

  it "renders the edit franken_beer form" do
    render

    assert_select "form[action=?][method=?]", franken_beer_path(@franken_beer), "post" do

      assert_select "input#franken_beer_beername[name=?]", "franken_beer[beername]"

      assert_select "input#franken_beer_active[name=?]", "franken_beer[active]"

      assert_select "input#franken_beer_rbid[name=?]", "franken_beer[rbid]"

      assert_select "input#franken_beer_franken_brewery_id[name=?]", "franken_beer[franken_brewery_id]"
    end
  end
end
