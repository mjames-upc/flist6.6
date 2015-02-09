require 'rails_helper'

RSpec.describe "franken_ratings/new", type: :view do
  before(:each) do
    assign(:franken_rating, FrankenRating.new(
      :score => 1.5,
      :comment => "MyText",
      :serving => 1,
      :user => nil,
      :franken_beer => nil,
      :franken_brewery => nil
    ))
  end

  it "renders new franken_rating form" do
    render

    assert_select "form[action=?][method=?]", franken_ratings_path, "post" do

      assert_select "input#franken_rating_score[name=?]", "franken_rating[score]"

      assert_select "textarea#franken_rating_comment[name=?]", "franken_rating[comment]"

      assert_select "input#franken_rating_serving[name=?]", "franken_rating[serving]"

      assert_select "input#franken_rating_user_id[name=?]", "franken_rating[user_id]"

      assert_select "input#franken_rating_franken_beer_id[name=?]", "franken_rating[franken_beer_id]"

      assert_select "input#franken_rating_franken_brewery_id[name=?]", "franken_rating[franken_brewery_id]"
    end
  end
end
