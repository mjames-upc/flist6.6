require 'rails_helper'

RSpec.describe "FrankenRatings", type: :request do
  describe "GET /franken_ratings" do
    it "works! (now write some real specs)" do
      get franken_ratings_path
      expect(response).to have_http_status(200)
    end
  end
end
