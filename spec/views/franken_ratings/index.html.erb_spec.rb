require 'rails_helper'

RSpec.describe "franken_ratings/index", type: :view do
  before(:each) do
    assign(:franken_ratings, [
      FrankenRating.create!(
        :score => 1.5,
        :comment => "MyText",
        :serving => 1,
        :user => nil,
        :franken_beer => nil,
        :franken_brewery => nil
      ),
      FrankenRating.create!(
        :score => 1.5,
        :comment => "MyText",
        :serving => 1,
        :user => nil,
        :franken_beer => nil,
        :franken_brewery => nil
      )
    ])
  end

  it "renders a list of franken_ratings" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
