require 'rails_helper'

RSpec.describe "franken_ratings/show", type: :view do
  before(:each) do
    @franken_rating = assign(:franken_rating, FrankenRating.create!(
      :score => 1.5,
      :comment => "MyText",
      :serving => 1,
      :user => nil,
      :franken_beer => nil,
      :franken_brewery => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
