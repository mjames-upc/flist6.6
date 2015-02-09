require 'rails_helper'

RSpec.describe "tag_records/edit", type: :view do
  before(:each) do
    @tag_record = assign(:tag_record, TagRecord.create!(
      :franken_beer => nil,
      :tag => nil
    ))
  end

  it "renders the edit tag_record form" do
    render

    assert_select "form[action=?][method=?]", tag_record_path(@tag_record), "post" do

      assert_select "input#tag_record_franken_beer_id[name=?]", "tag_record[franken_beer_id]"

      assert_select "input#tag_record_tag_id[name=?]", "tag_record[tag_id]"
    end
  end
end
