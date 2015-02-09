require 'rails_helper'

RSpec.describe "tag_records/show", type: :view do
  before(:each) do
    @tag_record = assign(:tag_record, TagRecord.create!(
      :franken_beer => nil,
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
