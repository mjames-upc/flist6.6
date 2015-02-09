require 'rails_helper'

RSpec.describe "franken_breweries/edit", type: :view do
  before(:each) do
    @franken_brewery = assign(:franken_brewery, FrankenBrewery.create!(
      :brewer_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :district => "MyString",
      :rbid => 1,
      :active => false,
      :founded => 1,
      :brewer_type => "MyString",
      :score => 1.5,
      :lat => 1.5,
      :lon => 1.5,
      :web => "MyString",
      :hours => "MyString",
      :description => "MyText",
      :phone => "MyString"
    ))
  end

  it "renders the edit franken_brewery form" do
    render

    assert_select "form[action=?][method=?]", franken_brewery_path(@franken_brewery), "post" do

      assert_select "input#franken_brewery_brewer_name[name=?]", "franken_brewery[brewer_name]"

      assert_select "input#franken_brewery_address[name=?]", "franken_brewery[address]"

      assert_select "input#franken_brewery_city[name=?]", "franken_brewery[city]"

      assert_select "input#franken_brewery_district[name=?]", "franken_brewery[district]"

      assert_select "input#franken_brewery_rbid[name=?]", "franken_brewery[rbid]"

      assert_select "input#franken_brewery_active[name=?]", "franken_brewery[active]"

      assert_select "input#franken_brewery_founded[name=?]", "franken_brewery[founded]"

      assert_select "input#franken_brewery_brewer_type[name=?]", "franken_brewery[brewer_type]"

      assert_select "input#franken_brewery_score[name=?]", "franken_brewery[score]"

      assert_select "input#franken_brewery_lat[name=?]", "franken_brewery[lat]"

      assert_select "input#franken_brewery_lon[name=?]", "franken_brewery[lon]"

      assert_select "input#franken_brewery_web[name=?]", "franken_brewery[web]"

      assert_select "input#franken_brewery_hours[name=?]", "franken_brewery[hours]"

      assert_select "textarea#franken_brewery_description[name=?]", "franken_brewery[description]"

      assert_select "input#franken_brewery_phone[name=?]", "franken_brewery[phone]"
    end
  end
end
