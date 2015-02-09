require 'rails_helper'

RSpec.describe "tag_records/new", type: :view do
  before(:each) do
    assign(:tag_record, TagRecord.new(
      :franken_beer => nil,
      :tag => nil
    ))
  end

  it "renders new tag_record form" do
    render

    assert_select "form[action=?][method=?]", tag_records_path, "post" do

      assert_select "input#tag_record_franken_beer_id[name=?]", "tag_record[franken_beer_id]"

      assert_select "input#tag_record_tag_id[name=?]", "tag_record[tag_id]"
    end
  end
end
