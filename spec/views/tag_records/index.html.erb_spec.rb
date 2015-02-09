require 'rails_helper'

RSpec.describe "tag_records/index", type: :view do
  before(:each) do
    assign(:tag_records, [
      TagRecord.create!(
        :franken_beer => nil,
        :tag => nil
      ),
      TagRecord.create!(
        :franken_beer => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of tag_records" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
